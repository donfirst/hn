# Outputs from the storage module
output "storage_account_name" {
  description = "Name of the storage account"
  value       = module.storage.storage_account_name
}
output "file_share_name" {
  description = "Name of the Azure File Share"
  value       = module.storage.file_share_name
}

# Outputs from the networking module
output "vnet_name" {
  description = "Name of the virtual network"
  value       = module.networking.vnet_name
}

output "public_subnet_name" {
  description = "Name of the public subnet"
  value       = module.networking.public_subnet_name
}

output "private_subnet_name" {
  description = "Name of the private subnet"
  value       = module.networking.private_subnet_name
}

output "storage_account_key" {
  value     = module.storage.storage_account_key
  sensitive = true
}


output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.networking.private_subnet_id
}

output "jump_box_nic_id" {
  description = "Network Interface ID of the jump box"
  value       = module.jump_box.jump_box_nic_id
}

output "jump_box_public_ip" {
  description = "Public IP address of the jump box"
  value       = module.jump_box.jump_box_public_ip
}


#Outputs from the compute module
output "private_vm_private_ips" {
  description = "Private IP addresses of the private VMs"
  value       = module.compute.private_vm_private_ips
}

#Outputs for Admin Usernames
output "admin_username" {
  description = "Admin username for VMs"
  value       = var.admin_username
}

output "jump_box_admin_username" {
  description = "Admin username for the jump box"
  value       = var.jump_box_admin_username
}
