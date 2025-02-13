## Get data subnetwork dan network dari shared VPC
data "google_compute_network" "network" {
  name    = var.network_name
  project = var.project_host_id
}

data "google_compute_subnetwork" "sub-network" {
  name    = var.subnetwork_name
  project = var.project_host_id
  region  = var.region
}

## Membuat job cloud run
resource "google_cloud_run_v2_service" "cr_svc" {
  for_each = { for service in var.cloud_run_services : service.name => service }

  name                = each.value.name
  location            = var.location
  deletion_protection = false
  ingress             = var.ingress

  template {
    containers {
      image = each.value.image
      resources {
        limits = {
          cpu    = each.value.cpu
          memory = each.value.memory
        }
      }
    }

    vpc_access {
      network_interfaces {
        network    = "projects/${var.project_host_id}/global/networks/${data.google_compute_network.network.name}"
        subnetwork = "projects/${var.project_host_id}/regions/${var.region}/subnetworks/${data.google_compute_subnetwork.sub-network.name}"
      }
    }

    labels = {
      env : var.env
    }
  }

  traffic {
    type    = var.traffic_type
    percent = var.percent
  }
}

## Membuat serverless network endpoint group (NEG)
resource "google_compute_region_network_endpoint_group" "serverless_neg" {
  for_each              = google_cloud_run_v2_service.cr_svc
  name                  = each.key
  network_endpoint_type = "SERVERLESS"
  region                = var.region

  cloud_run {
    service = each.key
  }
}

## Membuat backend service untuk cloud run
resource "google_compute_region_backend_service" "backend" {
  for_each              = google_cloud_run_v2_service.cr_svc
  name                  = each.key
  region                = var.region
  load_balancing_scheme = "INTERNAL_MANAGED"
  protocol              = "HTTP"

  backend {
    group = google_compute_region_network_endpoint_group.serverless_neg[each.key].id
  }

  depends_on = [google_cloud_run_v2_service.cr_svc]
}

## URL Map for Routing Rules
resource "google_compute_region_url_map" "url_map" {
  for_each        = google_cloud_run_v2_service.cr_svc
  name            = var.lb_name
  default_service = google_compute_region_backend_service.backend[each.key].id

  host_rule {
    hosts        = ["crm-sahabat-dev.pegadaian.co.id"]
    path_matcher = "path-matcher-1"
  }

  path_matcher {
    name            = "path-matcher-1"
    default_service = google_compute_region_backend_service.backend[each.key].id

    path_rule {
      paths   = ["/*"]
      service = google_compute_region_backend_service.backend[each.key].id
    }
  }
}

## Target HTTPS Proxy
resource "google_compute_region_target_http_proxy" "http_proxy" {
  for_each = google_compute_region_url_map.url_map
  name     = "internal-lb-http-proxy"
  region   = var.region
  url_map  = google_compute_region_url_map.url_map[each.key].id
}

## Membuat internal load balancer
resource "google_compute_forwarding_rule" "ilb" {
  for_each              = google_cloud_run_v2_service.cr_svc
  name                  = "fe-ilb-${each.key}"
  load_balancing_scheme = "INTERNAL_MANAGED"
  region                = var.region
  network               = "projects/${var.project_host_id}/global/networks/${data.google_compute_network.network.name}"
  subnetwork            = "projects/${var.project_host_id}/regions/${var.region}/subnetworks/${data.google_compute_subnetwork.sub-network.name}"

  ip_protocol           = "TCP"
  port_range            = "80"
  target                = google_compute_region_target_http_proxy.http_proxy[each.key].id
}