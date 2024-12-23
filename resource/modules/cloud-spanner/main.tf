provider "google" {
  project = var.project_id
}

# Aktifkan API Cloud Spanner
resource "google_project_service" "enable_spanner" {
  service = "spanner.googleapis.com"
}

# Cloud Spanner Instance
resource "google_spanner_instance" "spanner_instance" {
  name             = var.instance_name
  config           = var.config
  display_name     = var.display_name
  num_nodes        = var.num_nodes
  processing_units = var.processing_units
  labels           = var.labels

  depends_on = [google_project_service.enable_spanner]
}

# Cloud Spanner Database
resource "google_spanner_database" "spanner_database" {
  instance = google_spanner_instance.spanner_instance.name
  name     = var.database_name

  ddl = var.ddl

  depends_on = [google_spanner_instance.spanner_instance]
}
