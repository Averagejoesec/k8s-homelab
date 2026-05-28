output "vm_name" {
  value = proxmox_virtual_environment_vm.vm.name
}

output "vm_id" {
  value = proxmox_virtual_environment_vm.vm.vm_id
}

output "ip_address" {
  value = var.ip_address
}