## Enable Shared VPC network project
resource "google_compute_shared_vpc_host_project" "shr-net" {
  project = var.project_host_id
}

## Attach service project ke shared network host project
resource "google_compute_shared_vpc_service_project" "service-ce" {
  host_project      = google_compute_shared_vpc_host_project.shr-net.project
  service_project   = var.service_project
}