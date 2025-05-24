output "instance_ip" {
  value = google_compute_instance.mern_app_vm.network_interface[0].access_config[0].nat_ip
  description = "Public IP of the MERN app VM"
}

output "kubernetes_cluster_name" {
  value = google_container_cluster.primary.name
}

