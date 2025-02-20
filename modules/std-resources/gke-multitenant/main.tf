## Project id dan info
data "google_project" "svc_project" {
  project_id = var.service_project
}

## Get network dan subnetwork data
data "google_compute_network" "network" {
  name    = var.network_name
  project = var.project_host_id
}

data "google_compute_subnetwork" "sub-network" {
  name    = var.subnetwork_name
  project = var.project_host_id
  region  = var.region
}

## Membuat GKE menggunakan shared VPC
resource "google_container_cluster" "gke" {
  name                     = var.cluster_name
  location                 = var.zone
  initial_node_count       = var.initial_node_count
  network                  = data.google_compute_network.network.id
  subnetwork               = data.google_compute_subnetwork.sub-network.id
  remove_default_node_pool = true
  deletion_protection      = false

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pod_secondary_ip_range_name
    services_secondary_range_name = var.service_secondary_ip_range_name
  }

  workload_identity_config {
    workload_pool = "${data.google_project.svc_project.project_id}.svc.id.goog"
  }

  secret_manager_config {
    enabled = true
  }

  security_posture_config {
    mode = "BASIC"
  }

  resource_labels = {
    env = var.env
  }
}

## Untuk konfigurasi node pool
resource "google_container_node_pool" "nodepool" {
  provider    = "google-beta" 
  for_each    = var.node_pools
  name        = each.key
  location    = var.zone
  cluster     = google_container_cluster.gke.name
  node_count  = each.value.node_count

  node_config {
    machine_type = each.value.machine_type
    image_type   = "COS_CONTAINERD"
    labels       = each.value.labels
    disk_size_gb = each.value.disk_size_gb
    disk_type    = each.value.disk_type

    # Konfigurasi GKE sandbox hanya jika enable_gvisor = true
    dynamic "sandbox_config" {
      for_each = each.value.enable_gvisor ? [1] : []
      content {
        sandbox_type = "gvisor"
      }
    }
  }
}