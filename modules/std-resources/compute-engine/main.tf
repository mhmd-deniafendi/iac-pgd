# Get network dan subnetwork data
data "google_compute_network" "network" {
  name    = var.network_name
  project = var.project_host_id
}

data "google_compute_subnetwork" "sub-network" {
  name    = var.subnetwork_name
  project = var.project_host_id
  region  = var.region
}

## Membuat compute engine menggunakan shared VPC
resource "google_compute_instance" "instance" {
  count         = var.instance_count
  name          = "${var.instance_name}-${count.index}"
  machine_type  = var.instance_type
  zone          = var.zone
  tags          = var.instance_tags

  labels = {
    env = var.env
  }

  boot_disk {
    initialize_params {
      image = var.instance_os
      size  = var.disk_size
      type  = "pd-balanced"
    }
  }

  network_interface {
    network    = data.google_compute_network.network.id
    subnetwork = data.google_compute_subnetwork.sub-network.id
  }
}