provider "google" {
  project = var.project_id
  region  = var.region
}

# Aktifkan API Cloud SQL
resource "google_project_service" "enable_sql" {
  service = "sqladmin.googleapis.com"
}

# Cloud SQL Instance
resource "google_sql_database_instance" "cloud_sql" {
  name             = var.instance_name
  database_version = var.database_version
  region           = var.region

  settings {
    tier              = var.tier
    availability_type = var.availability_type

    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      require_ssl     = var.require_ssl

      dynamic "authorized_networks" {
        for_each = var.authorized_networks
        content {
          name  = authorized_networks.value.name
          value = authorized_networks.value.value
        }
      }
    }

    # Konfigurasi disk
    disk_size    = var.disk_size
    disk_type    = var.disk_type
    backup_configuration {
      enabled    = var.enable_backup
      start_time = var.backup_start_time
    }
  }

  depends_on = [google_project_service.enable_sql]
}

# Database (opsional)
resource "google_sql_database" "databases" {
  count      = length(var.databases)
  name       = var.databases[count.index].name
  instance   = google_sql_database_instance.cloud_sql.name
  charset    = var.databases[count.index].charset
  collation  = var.databases[count.index].collation
}

# Pengguna SQL (opsional)
resource "google_sql_user" "users" {
  count    = length(var.database_users)
  name     = var.database_users[count.index].name
  instance = google_sql_database_instance.cloud_sql.name
  password = var.database_users[count.index].password
}
