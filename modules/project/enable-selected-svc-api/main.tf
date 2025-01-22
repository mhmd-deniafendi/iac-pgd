## Untuk mengaktifkan api pada service tertentu
resource "google_project_service" "project" {
  for_each  = toset(var.services)
  project   = var.project_id
  service   = each.value
}