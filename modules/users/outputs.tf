output "public_keys" {
  description = "Public SSH keys for the users"
  value       = { for user, key in tls_private_key.ssh_keys : user => key.public_key_openssh }
}
