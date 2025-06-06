resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "networking" {
  source                  = "./modules/networking"
  resource_group_name     = azurerm_resource_group.main.name
  location                = var.location
  address_space           = var.address_space
  public_subnet_prefixes  = var.public_subnet_prefixes
  private_subnet_prefixes = var.private_subnet_prefixes
}

module "jump_box" {
  source                   = "./modules/jump_box"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = var.location
  jump_box_admin_username  = var.jump_box_admin_username
  jump_box_admin_ssh_key   = local.jump_box_admin_ssh_key
  jump_box_allowed_ssh_ips = var.jump_box_allowed_ssh_ips
  public_subnet_id         = module.networking.public_subnet_id
  jump_box_publisher       = var.jump_box_publisher
  jump_box_offer           = var.jump_box_offer
  jump_box_sku             = var.jump_box_sku
  jump_box_image_version   = var.jump_box_image_version
  jump_box_vm_size         = var.jump_box_vm_size
  jump_box_name            = var.jump_box_name
}

module "compute" {
  source               = "./modules/compute"
  resource_group_name  = azurerm_resource_group.main.name
  location             = var.location
  admin_username       = var.admin_username
  admin_ssh_key        = local.admin_ssh_key
  vnet_name            = module.networking.vnet_name
  public_subnet_name   = module.networking.public_subnet_name
  private_subnet_name  = module.networking.private_subnet_name
  private_subnet_id    = module.networking.private_subnet_id
  storage_account_name = module.storage.storage_account_name
  storage_account_key  = module.storage.storage_account_key
  file_share_name      = module.storage.file_share_name
  publisher            = var.publisher
  offer                = var.offer
  sku                  = var.sku
  image_version        = var.image_version
  private_vm_count     = var.private_vm_count
  vm_size              = var.vm_size
  allowed_ssh_ips      = var.allowed_ssh_ips
}

module "storage" {
  source                                                     = "./modules/storage"
  resource_group_name                                        = azurerm_resource_group.main.name
  location                                                   = var.location
  storage_account_name                                       = var.storage_account_name
  project_name                                               = var.project_name
  days                                                       = var.days
  https_traffic_only_enabled                                 = var.https_traffic_only_enabled
  account_replication_type                                   = var.account_replication_type
  tier_to_archive_after_days_since_modification_greater_than = var.tier_to_archive_after_days_since_modification_greater_than
  delete_after_days_since_modification_greater_than          = var.delete_after_days_since_modification_greater_than
  quota                                                      = var.quota
  file_share_name                                            = var.file_share_name
}
