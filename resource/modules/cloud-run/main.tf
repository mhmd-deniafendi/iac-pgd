provider "google" {
  project = var.project_id
  region  = var.region
}

# Layanan Cloud Run
resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image
        resources {
          limits = {
            cpu    = var.cpu_limit
            memory = var.memory_limit
          }
        }
        env = var.environment_variables
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_project_service.enable_cloud_run]
}

# Aktifkan Cloud Run dan Layanan Jaringan
resource "google_project_service" "enable_cloud_run" {
  service = "run.googleapis.com"
}

resource "google_project_service" "enable_network_services" {
  service = "compute.googleapis.com"
}

# Backend Cloud Run untuk Load Balancer
resource "google_compute_backend_service" "backend" {
  name                  = "${var.service_name}-backend"
  load_balancing_scheme = "INTERNAL"
  protocol              = "HTTP"

  backend {
    group = google_cloud_run_service.service.status[0].url
  }

  depends_on = [google_cloud_run_service.service]
}

# Internal Load Balancer (ILB)
resource "google_compute_global_forwarding_rule" "ilb" {
  name                  = "${var.service_name}-ilb"
  load_balancing_scheme = "INTERNAL"
  port_range            = "80"
  target                = google_compute_backend_service.backend.self_link
}
