output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.main.name
}

output "file_share_name" {
  description = "Name of the Azure File Share"
  value       = azurerm_storage_share.file_share.name
}

output "storage_account_connection_string" {
  description = "Connection string for the storage account"
  value       = azurerm_storage_account.main.primary_connection_string
}

output "storage_account_key" {
  value = azurerm_storage_account.main.primary_access_key
}
