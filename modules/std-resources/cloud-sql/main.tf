## Mendapatkan nama network dan subnetwork dari shared VPC
data "google_compute_network" "network" {
  name    = var.network_name
  project = var.project_host_id
}

data "google_compute_subnetwork" "sub-network" {
  name    = var.subnetwork_name
  project = var.project_host_id
  region  = var.region
}


## Membuat SQL instance
resource "google_sql_database_instance" "cloud_sql" {
  for_each = { for db_instance in var.db_instances_properties : db_instance.name => db_instance}
  
  name             = each.value.name
  project          = var.project_id
  database_version = each.value.database_version
  region           = var.region

  settings {
    tier              = each.value.tier
    availability_type = each.value.availability_type

    user_labels = {
        env = var.env
    }

    ip_configuration {
      ipv4_enabled    = false
      private_network = data.google_compute_network.network.self_link

      dynamic "authorized_networks" {
        for_each = var.authorized_networks
        content {
          name  = authorized_networks.value.name
          value = authorized_networks.value.cidr
        }
      }
    }

    # Konfigurasi disk
    disk_size    = each.value.sql_disk_size
    disk_type    = each.value.sql_disk_type
  }
}