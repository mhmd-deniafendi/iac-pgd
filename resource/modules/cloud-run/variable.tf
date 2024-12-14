variable "project_id" {
  description = "ID project GCP"
  type        = string
}

variable "region" {
  description = "Region GCP tempat resource akan dibuat"
  type        = string
  default     = "us-central1"
}

variable "service_name" {
  description = "Nama service Cloud Run"
  type        = string
}

variable "image" {
  description = "Image container untuk layanan Cloud Run"
  type        = string
}

variable "cpu_limit" {
  description = "Limit CPU untuk container"
  type        = string
  default     = "1"
}

variable "memory_limit" {
  description = "Limnit memori untuk container"
  type        = string
  default     = "512Mi"
}

variable "environment_variables" {
  description = "Variabel environment untuk container"
  type        = map(string)
  default     = {}
}
