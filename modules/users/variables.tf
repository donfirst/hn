variable "users" {
  description = "Map of users to create with their details"
  type = map(object({
    user_principal_name = string
    display_name        = string
    password            = string
  }))
}

variable "key_vault_id" {
  description = "ID of the Azure Key Vault to store SSH keys"
  type        = string
}
