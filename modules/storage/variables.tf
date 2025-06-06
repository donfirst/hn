variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "days" {
  description = "Number of days for retention policies"
  type        = number
}

variable "https_traffic_only_enabled" {
  description = "Enable HTTPS traffic only"
  type        = bool
}

variable "account_replication_type" {
  description = "Replication type for the storage account"
  type        = string
}

variable "tier_to_archive_after_days_since_modification_greater_than" {
  description = "Days since modification to archive"
  type        = number
}

variable "delete_after_days_since_modification_greater_than" {
  description = "Days since modification to delete"
  type        = number
}

variable "quota" {
  description = "Quota for the file share in GB"
  type        = number
}

variable "file_share_name" {
  description = "Name of the file share"
  type        = string
}
