variable "proxmox_endpoint" {
  type = string
}

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

variable "ssh_public_key" {
  type = string
  sensitive = true
}

variable "proxmox_address" {
  type = string
}