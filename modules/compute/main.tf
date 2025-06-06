resource "azurerm_network_security_group" "compute" {
  name                = "compute-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefixes    = var.allowed_ssh_ips
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "compute" {
  count                     = var.private_vm_count
  network_interface_id      = azurerm_network_interface.private_vms[count.index].id
  network_security_group_id = azurerm_network_security_group.compute.id
}

resource "azurerm_network_interface" "private_vms" {
  count               = var.private_vm_count
  name                = "private-vm-nic-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "private-vm-ip-config-${count.index + 1}"
    subnet_id                     = var.private_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "private_vms" {
  count               = var.private_vm_count
  name                = "private-vm-${count.index + 1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.private_vms[count.index].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.image_version
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_key
  }
}

resource "azurerm_virtual_machine_extension" "mount_fileshare" {
  count                = var.private_vm_count
  name                 = "mount-azfileshare"
  virtual_machine_id   = azurerm_linux_virtual_machine.private_vms[count.index].id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = <<SETTINGS
    {
      "commandToExecute": "apt-get update && apt-get install -y cifs-utils && mkdir -p /mnt/azfileshare && echo '//${var.storage_account_name}.file.core.windows.net/${var.file_share_name} /mnt/azfileshare cifs vers=3.0,username=${var.storage_account_name},password=${var.storage_account_key},dir_mode=0777,file_mode=0777,serverino' >> /etc/fstab && mount -a"
    }
SETTINGS

  depends_on = [azurerm_linux_virtual_machine.private_vms]
}
