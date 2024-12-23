provider "google" {
  project = var.project_id
}

# Aktifkan API Memorystore
resource "google_project_service" "enable_memorystore" {
  service = "redis.googleapis.com"
}

# Memorystore Instance (Redis atau Memcached)
resource "google_redis_instance" "redis" {
  count = var.engine_type == "REDIS" ? 1 : 0

  name           = var.instance_name
  memory_size_gb = var.memory_size_gb
  tier           = var.redis_tier
  region         = var.region

  # Opsional
  redis_version = var.redis_version
  display_name  = var.display_name
  labels        = var.labels

  authorized_network = var.authorized_network
  reserved_ip_range  = var.reserved_ip_range
  alternative_location_id = var.alternative_location_id

  depends_on = [google_project_service.enable_memorystore]
}

resource "google_memcache_instance" "memcached" {
  count = var.engine_type == "MEMCACHED" ? 1 : 0

  name           = var.instance_name
  region         = var.region
  node_count     = var.memcache_node_count
  node_config {
    cpu_count    = var.memcache_cpu_count
    memory_size_mb = var.memcache_memory_size_mb
  }

  # Opsional
  display_name = var.display_name
  labels       = var.labels

  authorized_network = var.authorized_network

  depends_on = [google_project_service.enable_memorystore]
}
