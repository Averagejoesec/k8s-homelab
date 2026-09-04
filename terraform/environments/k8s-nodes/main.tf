terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.3"
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = "${var.proxmox_api_token_id}=${var.proxmox_api_token_secret}"
  insecure  = true

  ssh {
    agent    = true
    username = "root"
    node {
      name    = "proxmox"
      address = "192.168.1.50"
      port    = 22
    }
  }
}

module "k8s_control" {
  source = "../../modules/vm"

  vm_name        = "k8s-control"
  vm_id          = 101
  cores          = 2
  memory         = 2048
  disk_size      = 30
  ip_address     = "10.0.0.51/24"
  gateway        = "10.0.0.1"
  ssh_public_key = var.ssh_public_key
  vm_description = "Kubernetes control plane"
}

module "k8s_worker_01" {
  source = "../../modules/vm"

  vm_name        = "k8s-worker-01"
  vm_id          = 102
  cores          = 2
  memory         = 2048
  disk_size      = 30
  ip_address     = "10.0.0.52/24"
  gateway        = "10.0.0.1"
  ssh_public_key = var.ssh_public_key
  vm_description = "Kubernetes worker node 01"
}

module "k8s_worker_02" {
  source = "../../modules/vm"

  vm_name        = "k8s-worker-02"
  vm_id          = 103
  cores          = 2
  memory         = 2048
  disk_size      = 30
  ip_address     = "10.0.0.53/24"
  gateway        = "10.0.0.1"
  ssh_public_key = var.ssh_public_key
  vm_description = "Kubernetes worker node 02"
}
