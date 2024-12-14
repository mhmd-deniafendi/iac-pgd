variable "project_id" {
  description = "ID Proyek GCP"
  type        = string
}

variable "bucket_name" {
  description = "Nama Cloud Storage bucket"
  type        = string
}

variable "location" {
  description = "Lokasi bucket (misalnya US, ASIA, EUROPE)"
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "Kelas penyimpanan bucket (STANDARD, NEARLINE, COLDLINE, ARCHIVE)"
  type        = string
  default     = "STANDARD"
}

variable "enable_versioning" {
  description = "Apakah versi objek diaktifkan untuk bucket"
  type        = bool
  default     = false
}

variable "retention_days" {
  description = "Berapa hari objek akan disimpan sebelum dihapus"
  type        = number
  default     = 0
}

variable "encryption_key" {
  description = "Kunci enkripsi KMS untuk bucket (opsional)"
  type        = string
  default     = null
}

variable "cors" {
  description = <<EOT
Pengaturan CORS untuk bucket (opsional).
Contoh:
[
  {
    origin          = ["*"]
    method          = ["GET", "POST"]
    response_header = ["Content-Type"]
    max_age_seconds = 3600
  }
]
EOT
  type        = list(object({
    origin          = list(string)
    method          = list(string)
    response_header = list(string)
    max_age_seconds = number
  }))
  default     = null
}
