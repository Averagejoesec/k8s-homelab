module "gitea_vm" {
  source = "../../modules/vm"

  vm_name        = "gitea"
  vm_id          = 100
  cores          = 1
  memory         = 1024
  disk_size      = 20
  ip_address     = "10.0.0.54/24"
  gateway        = "10.0.0.1"
  ssh_public_key = var.ssh_public_key
  vm_description = "Gitea self-hosted git server"
}