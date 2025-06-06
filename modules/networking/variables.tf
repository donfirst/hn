variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}
variable "public_subnet_prefixes" {
  description = "Address prefixes for public subnets"
  type        = list(string)
}
variable "private_subnet_prefixes" {
  description = "Address prefixes for private subnets"
  type        = list(string)
}
