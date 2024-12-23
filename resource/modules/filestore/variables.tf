variable "project_id" {
  description = "ID Proyek GCP"
  type        = string
}

variable "instance_name" {
  description = "Nama instance Filestore"
  type        = string
}

variable "region" {
  description = "Wilayah tempat instance dibuat (contoh: us-central1)"
  type        = string
  default     = "us-central1"
}

variable "tier" {
  description = <<EOT
Tier untuk Filestore. Pilihan:
- BASIC_HDD: Kapasitas besar, performa rendah.
- BASIC_SSD: Kapasitas sedang, performa tinggi.
- ENTERPRISE: Performa dan fitur tingkat lanjut.
EOT
  type    = string
  default = "BASIC_HDD"
}

variable "capacity_gb" {
  description = "Kapasitas penyimpanan (dalam GB)"
  type        = number
  default     = 1024
}

variable "share_name" {
  description = "Nama share untuk file system"
  type        = string
  default     = "filestore-share"
}

variable "network" {
  description = "Nama jaringan untuk instance Filestore"
  type        = string
  default     = "default"
}

variable "reserved_ip_range" {
  description = "IP range yang dipesan untuk Filestore (contoh: 10.0.0.0/29)"
  type        = string
  default     = null
}

variable "labels" {
  description = "Label untuk instance Filestore"
  type        = map(string)
  default     = {}
}
