variable "bucket_properties" {
  default = []
  type = list(object({
    name          = string
    location      = string #Lokasi bucket (misalnya US, ASIA, EUROPE)
    storage_class = string #Kelas penyimpanan bucket (STANDARD, NEARLINE, COLDLINE, ARCHIVE)
    force_destroy = bool
  }))
}

variable "bucket_name" {
  default = ""
  type    = string
}

variable "enable_versioning" {
  default = null
  type    = bool
}

variable "env" {
  default = ""
  type    = string
}

variable "retention_days" {
  default = ""
  type    = string
}

# variable "encryption_key" {
#   default = ""
#   type    = string
# }

# variable "cors" {
#   description = <<EOT
# Pengaturan CORS untuk bucket (opsional).
# Contoh:
# [
#   {
#     origin          = ["*"]
#     method          = ["GET", "POST"]
#     response_header = ["Content-Type"]
#     max_age_seconds = 3600
#   }
# ]
# EOT
#   type        = list(object({
#     origin          = list(string)
#     method          = list(string)
#     response_header = list(string)
#     max_age_seconds = number
#   }))
#   default     = null
# }