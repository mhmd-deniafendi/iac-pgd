variable "project_id" {
  description = "ID Proyek GCP"
  type        = string
}

variable "instance_name" {
  description = "Nama Cloud Spanner Instance"
  type        = string
}

variable "config" {
  description = <<EOT
Konfigurasi instance Spanner. Pilihan:
- regional-us-central1
- regional-asia-southeast1
- regional-europe-west1
- multi-region-us
EOT
  type        = string
  default     = "regional-us-central1"
}

variable "display_name" {
  description = "Nama tampilan untuk instance"
  type        = string
}

variable "num_nodes" {
  description = "Jumlah node untuk instance (hanya jika processing_units tidak digunakan)"
  type        = number
  default     = 1
}

variable "processing_units" {
  description = "Jumlah unit pemrosesan untuk instance (opsional)"
  type        = number
  default     = null
}

variable "labels" {
  description = "Label untuk instance Spanner"
  type        = map(string)
  default     = {}
}

variable "database_name" {
  description = "Nama database dalam instance"
  type        = string
}

variable "ddl" {
  description = <<EOT
Daftar DDL (Data Definition Language) untuk membuat tabel di database.
Contoh:
[
  "CREATE TABLE Users (UserId STRING(36) NOT NULL, Name STRING(100)) PRIMARY KEY(UserId)",
  "CREATE TABLE Orders (OrderId STRING(36) NOT NULL, UserId STRING(36), OrderDate TIMESTAMP) PRIMARY KEY(OrderId)"
]
EOT
  type        = list(string)
  default     = []
}
