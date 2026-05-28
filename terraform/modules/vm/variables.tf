variable "vm_name" {
  type        = string
  description = "Name of the VM"
}

variable "vm_id" {
  type        = number
  description = "Proxmox VM ID - must be unique"
}

variable "target_node" {
  type        = string
  description = "Proxmox node name - verify in UI top left"
  default     = "proxmox"
}

variable "cores" {
  type    = number
  default = 1
}

variable "memory" {
  default     = 1024
  description = "Memory in MB"
}

variable "disk_size" {
  type    = number
  default = 20
}

variable "ip_address" {
  type        = string
  description = "Static IP in CIDR format"
}

variable "gateway" {
  type        = string
  description = "Network gateway"
  default     = "10.0.0.1"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for ubuntu user"
  sensitive = true
}

variable "vm_description" {
  type    = string
  default = ""
}