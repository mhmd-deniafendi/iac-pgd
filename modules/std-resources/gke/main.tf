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

  security_posture_config {
    mode = "BASIC"
  }

  node_config {
    tags = var.instance_tags
  }

  resource_labels = {
    env = var.env
  }
}

## Untuk konfigurasi node pool
resource "google_container_node_pool" "nodepool" {
  name               = var.nodepool_name
  location           = var.zone
  cluster            = google_container_cluster.gke.name
  node_count         = var.node_count

  node_config {
    machine_type = var.machine_type
  }
}