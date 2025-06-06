# ---------------------------
# Global / Shared Variables
# ---------------------------
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

# ---------------------------
# Networking Module
# ---------------------------
variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "private_subnet_prefixes" {
  description = "Address prefixes for private subnets"
  type        = list(string)
}

variable "public_subnet_prefixes" {
  description = "Address prefixes for public subnets"
  type        = list(string)
}

# ---------------------------
# Compute Module
# ---------------------------

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
}

variable "allowed_ssh_ips" {
  description = "List of IP ranges allowed to SSH into the jump box"
  type        = list(string)
}

variable "image_version" {
  description = "Image version"
  type        = string
}

variable "offer" {
  description = "Image offer"
  type        = string
}

variable "private_vm_count" {
  description = "Number of private VMs to create"
  type        = number
}

variable "publisher" {
  description = "Image publisher"
  type        = string
}

variable "sku" {
  description = "Image SKU"
  type        = string
}

variable "vm_size" {
  description = "Size of the Azure VM"
  type        = string
}

# ---------------------------
# Storage Module
# ---------------------------
variable "account_replication_type" {
  description = "Replication type for the storage account"
  type        = string
}

variable "days" {
  description = "Number of days for retention policies"
  type        = number
}

variable "delete_after_days_since_modification_greater_than" {
  description = "Days since modification to delete"
  type        = number
}

variable "file_share_name" {
  description = "Name of the file share"
  type        = string
}

variable "https_traffic_only_enabled" {
  description = "Enable HTTPS traffic only"
  type        = bool
}

variable "quota" {
  description = "Quota for the file share in GB"
  type        = number
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "tier_to_archive_after_days_since_modification_greater_than" {
  description = "Days since modification to archive"
  type        = number
}

# ---------------------------
# Jump Box
# ---------------------------

variable "jump_box_admin_username" {
  description = "Admin username for the jump box"
  type        = string
}

variable "jump_box_allowed_ssh_ips" {
  description = "Allowed SSH IPs for the jump box"
  type        = list(string)
}

variable "jump_box_image_version" {
  description = "Image version for the jump box"
  type        = string
}

variable "jump_box_name" {
  description = "Base name for jump box resources"
  type        = string
}

variable "jump_box_offer" {
  description = "Image offer for the jump box"
  type        = string
}

variable "jump_box_publisher" {
  description = "Image publisher for the jump box"
  type        = string
}

variable "jump_box_sku" {
  description = "Image SKU for the jump box"
  type        = string
}

variable "jump_box_vm_size" {
  description = "VM size for the jump box"
  type        = string
}
