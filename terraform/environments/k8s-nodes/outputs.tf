output "control_plane_ip" {
  value = module.k8s_control.ip_address
}

output "worker_01_ip" {
  value = module.k8s_worker_01.ip_address
}

output "worker_02_ip" {
  value = module.k8s_worker_02.ip_address
}
