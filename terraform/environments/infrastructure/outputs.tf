# terraform/environments/infrastructure/outputs.tf
output "pihole_ip" {
  value = module.pihole_vm.ip_address
}

output "vault_ip" {
  value = module.vault_vm.ip_address
}