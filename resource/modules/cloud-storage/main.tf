provider "google" {
  project = var.project_id
}

# Aktifkan API Cloud Storage
resource "google_project_service" "enable_storage" {
  service = "storage.googleapis.com"
}

# Cloud Storage Bucket
resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.location
  storage_class = var.storage_class

  # Konfigurasi versi objek
  versioning {
    enabled = var.enable_versioning
  }

  # Retensi objek (opsional)
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = var.retention_days
    }
  }

  # Enkripsi bucket (opsional)
  dynamic "encryption" {
    for_each = var.encryption_key != null ? [1] : []
    content {
      default_kms_key_name = var.encryption_key
    }
  }

  # Kontrol akses bucket (opsional)
  dynamic "cors" {
    for_each = var.cors != null ? var.cors : []
    content {
      origin          = cors.value.origin
      method          = cors.value.method
      response_header = cors.value.response_header
      max_age_seconds = cors.value.max_age_seconds
    }
  }

  depends_on = [google_project_service.enable_storage]
}
