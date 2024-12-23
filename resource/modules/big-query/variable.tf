variable "project_id" {
  description = "ID Proyek GCP"
  type        = string
}

variable "dataset_id" {
  description = "ID untuk BigQuery Dataset"
  type        = string
}

variable "location" {
  description = "Lokasi dataset (misalnya US, EU)"
  type        = string
  default     = "US"
}

variable "friendly_name" {
  description = "Nama yang ramah untuk dataset"
  type        = string
  default     = null
}

variable "description" {
  description = "Deskripsi untuk dataset"
  type        = string
  default     = null
}

variable "labels" {
  description = "Label untuk dataset"
  type        = map(string)
  default     = {}
}

variable "default_table_expiration_ms" {
  description = "Waktu kedaluwarsa tabel default dalam dataset (milidetik)"
  type        = number
  default     = null
}

variable "access_role" {
  description = "Peran akses untuk dataset"
  type        = string
  default     = null
}

variable "access_user_by_email" {
  description = "Email pengguna yang diberikan akses"
  type        = string
  default     = null
}

variable "tables" {
  description = <<EOT
Peta tabel untuk dibuat dalam dataset.
Contoh:
{
  "table1" = {
    schema = jsonencode([
      { name = "id", type = "STRING", mode = "REQUIRED" },
      { name = "name", type = "STRING", mode = "NULLABLE" },
      { name = "created_at", type = "TIMESTAMP", mode = "NULLABLE" }
    ])
    partitioning = {
      type          = "DAY",
      field         = "created_at",
      expiration_ms = null
    }
    clustering_fields = ["name"]
  }
}
EOT
  type = map(object({
    schema = string
    partitioning = object({
      type          = string
      field         = string
      expiration_ms = number
    })
    clustering_fields = list(string)
  }))
  default = {}
}
