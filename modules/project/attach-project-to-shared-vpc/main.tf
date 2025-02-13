## Attach service project ke shared network host project
resource "google_compute_shared_vpc_service_project" "service-ce" {
  host_project      = var.project_host_id
  service_project   = var.service_project
}