module "harbor_vm" {
  source = "../../modules/vm"

  vm_name        = "harbor"
  vm_id          = 105
  cores          = 2
  memory         = 4096
  disk_size      = 50
  ip_address     = "10.0.0.55/24"
  gateway        = "10.0.0.1"
  ssh_public_key = var.ssh_public_key
  vm_description = "Harbor container registry"
}