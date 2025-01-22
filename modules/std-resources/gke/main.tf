## Project id dan info
data "google_project" "svc_project" {}

## Mementukan tenant
locals {
  teams = toset([
    var.tenant,
    var.tenant2
  ])
}

## GKE scope hub
resource "google_gke_hub_scope" "hub_scope_default" {
  for_each = local.teams

  project = data.google_project.svc_project.project_id
  scope_id = "${each.key}-team"
}

## Enable Shared VPC network project
resource "google_compute_shared_vpc_host_project" "shr-net" {
  project = var.project_host_id
}

## Attach gke ke shared network project
resource "google_compute_shared_vpc_service_project" "service-ce" {
  host_project      = google_compute_shared_vpc_host_project.shr-net.project
  service_project   = var.service_project
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
  location                 = var.region
  initial_node_count       = var.initial_node_count
  network                  = data.google_compute_network.network.id
  subnetwork               = data.google_compute_subnetwork.sub-network.id
  remove_default_node_pool = true

  fleet {
    project = data.google_project.svc_project.project_id
  }

  workload_identity_config {
    workload_pool = "${data.google_project.svc_project.project_id}.svc.id.goog"
  }

  security_posture_config {
    mode = "BASIC"
  }

  node_config {
    labels = {
      env = "${var.env}"
    }
    tags = var.instance_tags
  }
}

## Untuk konfigurasi node pool
resource "google_container_node_pool" "nodepool" {
  name       = var.nodepool_name
  location   = var.region
  cluster    = google_container_cluster.gke.name
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
  }
}

resource "google_gke_hub_membership_binding" "default" {
  for_each              = google_gke_hub_scope.hub_scope_default

  project               = data.google_project.svc_project.project_id
  membership_binding_id = each.value.scope_id
  scope                 = each.value.name
  membership_id         = google_container_cluster.gke.fleet[0].membership_id
  location              = google_container_cluster.gke.fleet[0].membership_location
}
