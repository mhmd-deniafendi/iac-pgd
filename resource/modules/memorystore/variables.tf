variable "project_id" {
  description = "ID Proyek GCP"
  type        = string
}

variable "engine_type" {
  description = "Tipe engine Memorystore (REDIS atau MEMCACHED)"
  type        = string
  default     = "REDIS"
}

variable "instance_name" {
  description = "Nama instance Memorystore"
  type        = string
}

variable "region" {
  description = "Wilayah tempat instance dibuat"
  type        = string
  default     = "us-central1"
}

variable "display_name" {
  description = "Nama tampilan untuk instance"
  type        = string
  default     = null
}

variable "labels" {
  description = "Label untuk instance"
  type        = map(string)
  default     = {}
}

# Redis-specific variables
variable "memory_size_gb" {
  description = "Ukuran memori untuk Redis (dalam GB)"
  type        = number
  default     = 1
}

variable "redis_version" {
  description = "Versi Redis yang digunakan"
  type        = string
  default     = "REDIS_6_X"
}

variable "redis_tier" {
  description = "Tier Redis (STANDARD_HA atau BASIC)"
  type        = string
  default     = "STANDARD_HA"
}

variable "authorized_network" {
  description = "Jaringan yang diizinkan untuk mengakses instance"
  type        = string
  default     = null
}

variable "reserved_ip_range" {
  description = "IP range yang dipesan untuk Redis (opsional)"
  type        = string
  default     = null
}

variable "alternative_location_id" {
  description = "Zona alternatif untuk failover (hanya untuk Redis)"
  type        = string
  default     = null
}

# Memcached-specific variables
variable "memcache_node_count" {
  description = "Jumlah node untuk Memcached"
  type        = number
  default     = 1
}

variable "memcache_cpu_count" {
  description = "Jumlah CPU per node untuk Memcached"
  type        = number
  default     = 1
}

variable "memcache_memory_size_mb" {
  description = "Ukuran memori per node untuk Memcached (dalam MB)"
  type        = number
  default     = 1024
}
