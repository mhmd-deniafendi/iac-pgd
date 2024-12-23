provider "google" {
  project = var.project_id
}

# Aktifkan API Cloud Functions
resource "google_project_service" "enable_cloud_function" {
  service = "cloudfunctions.googleapis.com"
}

# Cloud Function
resource "google_cloudfunctions_function" "cloud_function" {
  name        = var.function_name
  description = var.description
  runtime     = var.runtime
  region      = var.region
  available_memory_mb = var.memory_mb
  timeout     = var.timeout

  # Code source (Zip file atau direktori lokal)
  source_archive_bucket = var.source_archive_bucket
  source_archive_object = var.source_archive_object

  # Environment variables
  environment_variables = var.environment_variables

  # Event triggers
  dynamic "event_trigger" {
    for_each = var.event_trigger != null ? [1] : []
    content {
      event_type = var.event_trigger.event_type
      resource   = var.event_trigger.resource
      failure_policy {
        retry = var.event_trigger.failure_policy_retry
      }
    }
  }

  # HTTP Trigger
  dynamic "https_trigger" {
    for_each = var.enable_http_trigger ? [1] : []
    content {}
  }

  depends_on = [google_project_service.enable_cloud_function]
}
