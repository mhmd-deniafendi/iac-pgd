provider "google" {
  project = var.project_id
}

# Aktifkan API Filestore
resource "google_project_service" "enable_filestore" {
  service = "file.googleapis.com"
}

# Filestore Instance
resource "google_filestore_instance" "filestore_instance" {
  name       = var.instance_name
  region     = var.region
  tier       = var.tier
  file_shares {
    capacity_gb = var.capacity_gb
    name        = var.share_name
  }
  networks {
    network      = var.network
    reserved_ip_range = var.reserved_ip_range
  }
  labels = var.labels

  depends_on = [google_project_service.enable_filestore]
}
