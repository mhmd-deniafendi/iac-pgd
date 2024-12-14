provider "google" {
  project = var.project_id
  region  = var.region
}

# Aktifkan API Kubernetes Engine
resource "google_project_service" "enable_gke" {
  service = "container.googleapis.com"
}

# Cluster GKE
resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.region

  # Konfigurasi cluster
  initial_node_count = var.initial_node_count
  network            = var.network
  subnetwork         = var.subnetwork

  # Versi Kubernetes
  min_master_version = var.master_version

  # Konfigurasi keamanan
  remove_default_node_pool = true
  ip_allocation_policy {
    use_ip_aliases = true
  }

  # Opsi logging dan monitoring
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  depends_on = [google_project_service.enable_gke]
}

# Node Pool
resource "google_container_node_pool" "node_pool" {
  cluster    = google_container_cluster.cluster.name
  location   = var.region
  name       = "${var.cluster_name}-node-pool"
  node_count = var.node_count

  # Konfigurasi template node
  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    labels = var.node_labels
    tags   = var.node_tags
  }

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }

  depends_on = [google_container_cluster.cluster]
}
