variable "project_id" {
  description = "ID Proyek GCP"
  type        = string
}

variable "region" {
  description = "Wilayah tempat instance akan dibuat"
  type        = string
  default     = "us-central1"
}

variable "instance_name" {
  description = "Nama Cloud SQL Instance"
  type        = string
}

variable "database_version" {
  description = "Versi database (MYSQL_8_0, POSTGRES_14, SQLSERVER_2019_STANDARD, dll.)"
  type        = string
  default     = "MYSQL_8_0"
}

variable "tier" {
  description = "Tier mesin (misalnya db-f1-micro, db-n1-standard-1)"
  type        = string
  default     = "db-f1-micro"
}

variable "availability_type" {
  description = "Tipe ketersediaan (ZONAL atau REGIONAL)"
  type        = string
  default     = "ZONAL"
}

variable "disk_size" {
  description = "Ukuran disk penyimpanan (GB)"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "Tipe disk (PD_SSD atau PD_HDD)"
  type        = string
  default     = "PD_SSD"
}

variable "ipv4_enabled" {
  description = "Apakah alamat IPv4 diaktifkan untuk instance"
  type        = bool
  default     = true
}

variable "require_ssl" {
  description = "Apakah SSL diperlukan untuk koneksi"
  type        = bool
  default     = true
}

variable "authorized_networks" {
  description = <<EOT
Daftar jaringan yang diizinkan untuk mengakses instance.
Contoh:
[
  { name = "home-network", value = "203.0.113.0/24" }
]
EOT
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
}

variable "enable_backup" {
  description = "Apakah backup otomatis diaktifkan"
  type        = bool
  default     = true
}

variable "backup_start_time" {
  description = "Waktu mulai backup otomatis (format HH:MM, UTC)"
  type        = string
  default     = "03:00"
}

variable "databases" {
  description = <<EOT
Daftar database yang akan dibuat di instance.
Contoh:
[
  { name = "app_db", charset = "utf8", collation = "utf8_general_ci" }
]
EOT
  type        = list(object({
    name      = string
    charset   = string
    collation = string
  }))
  default     = []
}

variable "database_users" {
  description = <<EOT
Daftar pengguna SQL yang akan dibuat di instance.
Contoh:
[
  { name = "admin", password = "password123" }
]
EOT
  type        = list(object({
    name     = string
    password = string
  }))
  default     = []
}
