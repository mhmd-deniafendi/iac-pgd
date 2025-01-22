output "network_name" {
  value = data.google_compute_network.network.name
}

output "subnetwork_name" {
  value = data.google_compute_subnetwork.sub-network.name
}