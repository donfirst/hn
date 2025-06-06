# ---------------------------
# Global / Shared Variables
# ---------------------------
location            = "UK South"               # Azure region for resources
project_name        = "Piotr_Kosinski_Project" # Project name for resource naming
resource_group_name = "Piotr_Kosinski_RG"      # Name of the resource group

# ---------------------------
# Networking Module
# ---------------------------
address_space           = ["10.0.0.0/16"] # VNet address space
private_subnet_prefixes = ["10.0.2.0/24"] # Private subnet prefixes
public_subnet_prefixes  = ["10.0.1.0/24"] # Public subnet prefixes

# ---------------------------
# Compute Module
# ---------------------------
# admin_ssh_key   = file("./ssh/id_rsa.pub")          # SSH key for admin user
admin_username  = "adminUser"                       # Admin username for VMs
allowed_ssh_ips = ["192.168.1.0/24", "10.0.0.0/16"] # Allowed SSH IPs for VMs

# VM Image Parameters
image_version = "latest"                       # VM image version
offer         = "0001-com-ubuntu-server-jammy" # VM image offer
publisher     = "Canonical"                    # VM image publisher
sku           = "22_04-lts-gen2"               # VM image SKU

private_vm_count = 2              # Number of private VMs
vm_size          = "Standard_B1s" # VM size

# ---------------------------
# Storage Module
# ---------------------------
account_replication_type                                   = "LRS"                  # Storage account replication type
days                                                       = 7                      # Retention policy days
delete_after_days_since_modification_greater_than          = 365                    # Days to delete after modification
file_share_name                                            = "vm-fileshare"         # File share name
https_traffic_only_enabled                                 = true                   # HTTPS only for storage
quota                                                      = 120                    # File share quota (GB)
storage_account_name                                       = "piotrkosinskistorage" # Storage account name
tier_to_archive_after_days_since_modification_greater_than = 7                      # Days to archive after modification

# ---------------------------
# Jump Box
# ---------------------------
jump_box_admin_username  = "jumpadmin"                    # Jump box admin username
jump_box_allowed_ssh_ips = ["0.0.0.0/0"]                  # Allowed SSH IPs for jump box
jump_box_image_version   = "latest"                       # Jump box image version
jump_box_name            = "jump-box"                     # Jump box name
jump_box_offer           = "0001-com-ubuntu-server-jammy" # Jump box image offer
jump_box_publisher       = "Canonical"                    # Jump box image publisher
jump_box_sku             = "22_04-lts-gen2"               # Jump box image SKU
jump_box_vm_size         = "Standard_B1s"                                                                                                                                                                                                                                                       # Jump box VM size
