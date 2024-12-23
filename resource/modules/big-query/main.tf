provider "google" {
  project = var.project_id
}

# Aktifkan API BigQuery
resource "google_project_service" "enable_bigquery" {
  service = "bigquery.googleapis.com"
}

# BigQuery Dataset
resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.dataset_id
  project    = var.project_id
  location   = var.location
  friendly_name = var.friendly_name
  description   = var.description
  labels        = var.labels

  default_table_expiration_ms = var.default_table_expiration_ms
  access {
    role          = var.access_role
    user_by_email = var.access_user_by_email
  }

  depends_on = [google_project_service.enable_bigquery]
}

# BigQuery Tables
resource "google_bigquery_table" "table" {
  for_each = var.tables

  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = each.key
  project    = var.project_id
  schema     = each.value.schema

  time_partitioning {
    type                     = each.value.partitioning.type
    field                    = each.value.partitioning.field
    expiration_ms            = each.value.partitioning.expiration_ms
  }



  depends_on = [google_bigquery_dataset.dataset]
}
