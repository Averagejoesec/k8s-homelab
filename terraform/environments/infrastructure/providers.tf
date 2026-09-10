terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.3"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.0"
    }
  }
}

provider "vault" {
  address = "http://localhost:8200"
  # Token read from VAULT_TOKEN env var - never hardcoded
}

provider "proxmox" {
  endpoint  = data.vault_kv_secret_v2.proxmox.data["endpoint"]
  api_token = "${data.vault_kv_secret_v2.proxmox.data["api_token_id"]}=${data.vault_kv_secret_v2.proxmox.data["api_token_secret"]}"
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

data "vault_kv_secret_v2" "proxmox" {
  mount = "homelab"
  name  = "proxmox"
}

data "vault_kv_secret_v2" "ssh" {
  mount = "homelab"
  name  = "ssh"
}