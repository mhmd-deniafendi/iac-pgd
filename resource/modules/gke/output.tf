output "cluster_name" {
  description = "Nama cluster GKE"
  value       = google_container_cluster.cluster.name
}

output "endpoint" {
  description = "Endpoint API Kubernetes untuk cluster"
  value       = google_container_cluster.cluster.endpoint
}

output "node_pool_name" {
  description = "Nama node pool yang dibuat"
  value       = google_container_node_pool.node_pool.name
}
