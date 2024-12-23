variable "project_id" {
  description = "ID Proyek GCP"
  type        = string
}

variable "function_name" {
  description = "Nama Cloud Function"
  type        = string
}

variable "description" {
  description = "Deskripsi fungsi"
  type        = string
  default     = ""
}

variable "runtime" {
  description = "Runtime fungsi (misalnya python310, nodejs18, go120, dll.)"
  type        = string
}

variable "region" {
  description = "Wilayah tempat fungsi dijalankan"
  type        = string
  default     = "us-central1"
}

variable "memory_mb" {
  description = "Memori yang dialokasikan untuk fungsi (128, 256, 512, 1024, dll.)"
  type        = number
  default     = 256
}

variable "timeout" {
  description = "Batas waktu eksekusi fungsi (dalam detik)"
  type        = number
  default     = 60
}

variable "source_archive_bucket" {
  description = "Nama bucket Cloud Storage yang menyimpan kode fungsi"
  type        = string
}

variable "source_archive_object" {
  description = "Nama file dalam bucket yang berisi kode fungsi (zip file)"
  type        = string
}

variable "environment_variables" {
  description = "Daftar variabel lingkungan untuk fungsi"
  type        = map(string)
  default     = {}
}

variable "enable_http_trigger" {
  description = "Apakah fungsi menggunakan HTTP trigger"
  type        = bool
  default     = false
}

variable "event_trigger" {
  description = <<EOT
Event trigger untuk fungsi (opsional).
Contoh:
{
  event_type          = "google.pubsub.topic.publish"
  resource            = "projects/my-project/topics/my-topic"
  failure_policy_retry = true
}
EOT
  type = object({
    event_type          = string
    resource            = string
    failure_policy_retry = bool
  })
  default = null
}
