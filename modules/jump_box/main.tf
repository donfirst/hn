resource "azurerm_network_security_group" "jump_box" {
  name                = "${var.jump_box_name}-nsg"
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
    source_address_prefixes    = var.jump_box_allowed_ssh_ips
    destination_address_prefix = "*"
  }
}

resource "azurerm_public_ip" "jump_box" {
  name                = "${var.jump_box_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
}

resource "azurerm_network_interface" "jump_box" {
  name                = "${var.jump_box_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.jump_box_name}-ip-config"
    subnet_id                     = var.public_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jump_box.id
  }
}

resource "azurerm_network_interface_security_group_association" "jump_box" {
  network_interface_id      = azurerm_network_interface.jump_box.id
  network_security_group_id = azurerm_network_security_group.jump_box.id
}


resource "azurerm_linux_virtual_machine" "jump_box" {
  name                = var.jump_box_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.jump_box_vm_size
  admin_username      = var.jump_box_admin_username

  network_interface_ids = [
    azurerm_network_interface.jump_box.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.jump_box_publisher
    offer     = var.jump_box_offer
    sku       = var.jump_box_sku
    version   = var.jump_box_image_version
  }

  admin_ssh_key {
    username   = var.jump_box_admin_username
    public_key = var.jump_box_admin_ssh_key
  }
}
