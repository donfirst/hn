resource "azurerm_storage_account" "main" {
  name                       = var.storage_account_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  account_tier               = "Standard"
  account_replication_type   = var.account_replication_type
  https_traffic_only_enabled = var.https_traffic_only_enabled

  blob_properties {
    delete_retention_policy {
      days = var.days
    }
  }

  tags = {
    environment = "TerraformDemo"
    project     = var.project_name
  }
}

resource "azurerm_storage_management_policy" "lifecycle" {
  storage_account_id = azurerm_storage_account.main.id

  rule {
    name    = "lifecycle-policy"
    enabled = true

    filters {
      blob_types = ["blockBlob"]
    }

    actions {
      base_blob {
        tier_to_archive_after_days_since_modification_greater_than = var.tier_to_archive_after_days_since_modification_greater_than
        delete_after_days_since_modification_greater_than          = var.delete_after_days_since_modification_greater_than
      }
    }
  }
}

resource "azurerm_storage_share" "file_share" {
  name                 = var.file_share_name
  storage_account_name = azurerm_storage_account.main.name
  quota                = var.quota
}
