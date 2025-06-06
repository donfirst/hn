output "jump_box_nic_id" {
  description = "ID of the jump box network interface"
  value       = azurerm_network_interface.jump_box.id
}

output "jump_box_public_ip" {
  description = "Public IP address of the jump box"
  value       = azurerm_public_ip.jump_box.ip_address
}

output "jump_box_vm_id" {
  description = "ID of the jump box virtual machine"
  value       = azurerm_linux_virtual_machine.jump_box.id
}

output "jump_box_private_ip" {
  description = "Private IP address of the jump box"
  value       = azurerm_network_interface.jump_box.private_ip_address
}
