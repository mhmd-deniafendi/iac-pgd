# Cloud Storage Bucket
resource "google_storage_bucket" "bucket" {
  for_each = { for bucket in var.bucket_properties : bucket.name => bucket}

  name          = each.value.name
  location      = each.value.location
  storage_class = each.value.storage_class
  force_destroy = each.value.force_destroy

  # Konfigurasi versi objek
  versioning {
    enabled = var.enable_versioning
  }

  labels = {
    env = var.env
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
  # dynamic "encryption" {
  #   for_each = var.encryption_key != null ? [1] : []
  #   content {
  #     default_kms_key_name = var.encryption_key
  #   }
  # }

  # Kontrol akses bucket (opsional)
  # dynamic "cors" {
  #   for_each = var.cors != null ? var.cors : []
  #   content {
  #     origin          = cors.value.origin
  #     method          = cors.value.method
  #     response_header = cors.value.response_header
  #     max_age_seconds = cors.value.max_age_seconds
  #   }
  # }
}