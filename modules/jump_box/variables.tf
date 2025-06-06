variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "jump_box_admin_ssh_key" {
  description = "SSH public key for the jump box"
  type        = string
}

variable "jump_box_admin_username" {
  description = "Admin username for the jump box"
  type        = string
}

variable "jump_box_allowed_ssh_ips" {
  description = "Allowed SSH IPs for the jump box"
  type        = list(string)
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

variable "jump_box_image_version" {
  description = "Image version for the jump box"
  type        = string
}

variable "jump_box_name" {
  description = "Base name for jump box resources"
  type        = string
}

variable "jump_box_vm_size" {
  description = "VM size for the jump box"
  type        = string
}


#
