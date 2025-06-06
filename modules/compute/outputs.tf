output "private_vm_private_ips" {
  description = "Private IP addresses of the private VMs"
  value = [
    for nic in azurerm_network_interface.private_vms : nic.private_ip_address
  ]
}
