# Create Azure Entra ID Users
resource "azuread_user" "users" {
  for_each = var.users

  user_principal_name   = each.value.user_principal_name
  display_name          = each.value.display_name
  password              = each.value.password
  force_password_change = true
}

# Generate SSH Keys for Each User
resource "tls_private_key" "ssh_keys" {
  for_each = var.users

  algorithm = "RSA"
  rsa_bits  = 4096
}

# Store SSH Keys in Azure Key Vault
resource "azurerm_key_vault_secret" "private_keys" {
  for_each = var.users

  name         = "${each.key}-private-key"
  value        = tls_private_key.ssh_keys[each.key].private_key_pem
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "public_keys" {
  for_each = var.users

  name         = "${each.key}-public-key"
  value        = tls_private_key.ssh_keys[each.key].public_key_openssh
  key_vault_id = var.key_vault_id
}

# Output Public Keys for VM Configuration
output "public_keys" {
  value = { for user, key in tls_private_key.ssh_keys : user => key.public_key_openssh }
}
