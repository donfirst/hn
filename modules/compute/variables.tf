variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
}

variable "admin_ssh_key" {
  description = "Public SSH key for admin access"
  type        = string
}

variable "allowed_ssh_ips" {
  description = "List of IP ranges allowed to SSH into the compute VMs"
  type        = list(string)
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        = string
}

variable "private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}
variable "storage_account_key" {
  description = "Primary key of the storage account"
  type        = string
  sensitive   = true
}
variable "file_share_name" {
  description = "Name of the Azure File Share"
  type        = string
}

variable "publisher" {
  description = "Image publisher"
  type        = string
}

variable "offer" {
  description = "Image offer"
  type        = string
}

variable "sku" {
  description = "Image SKU"
  type        = string
}

variable "image_version" {
  description = "Image version"
  type        = string
}

variable "private_vm_count" {
  description = "Number of private VMs to create"
  type        = number
}

variable "vm_size" {
  description = "Size of the Azure VM"
  type        = string
}
