variable "project_id" {
  description = "ID Proyek GCP"
  type        = string
}

variable "region" {
  description = "Wilayah tempat cluster akan dibuat"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "Nama cluster GKE"
  type        = string
}

variable "initial_node_count" {
  description = "Jumlah node awal untuk cluster (hanya digunakan jika node pool default dibuat)"
  type        = number
  default     = 1
}

variable "master_version" {
  description = "Versi Kubernetes untuk master GKE"
  type        = string
  default     = "1.26"
}

variable "network" {
  description = "Nama jaringan tempat cluster akan dibuat"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Nama subnetwork tempat cluster akan dibuat"
  type        = string
}

variable "node_count" {
  description = "Jumlah node default di node pool"
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "Jenis mesin untuk node"
  type        = string
  default     = "e2-medium"
}

variable "disk_size" {
  description = "Ukuran disk (GB) untuk node"
  type        = number
  default     = 100
}

variable "node_labels" {
  description = "Label untuk node di node pool"
  type        = map(string)
  default     = {}
}

variable "node_tags" {
  description = "Tag jaringan untuk node di node pool"
  type        = list(string)
  default     = []
}

variable "min_node_count" {
  description = "Jumlah minimum node untuk autoscaling"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Jumlah maksimum node untuk autoscaling"
  type        = number
  default     = 5
}
