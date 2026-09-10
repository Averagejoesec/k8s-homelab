module "pihole_vm" {
  source = "../../modules/vm"

  vm_name        = "pihole"
  vm_id          = 106
  cores          = 1
  memory         = 512
  disk_size      = 10
  ip_address     = "10.0.0.56/24"
  gateway        = "10.0.0.1"
  ssh_public_key = data.vault_kv_secret_v2.ssh.data["public_key"]
  vm_description = "Pi-hole DNS + ad blocking"
}

module "vault_vm" {
  source = "../../modules/vm"

  vm_name        = "vault"
  vm_id          = 107
  cores          = 1
  memory         = 2048
  disk_size      = 20
  ip_address     = "10.0.0.57/24"
  gateway        = "10.0.0.1"
  ssh_public_key = var.ssh_public_key
  vm_description = "HashiCorp Vault secrets management"
}