output "instance_name" {
  description = "Nama instance Memorystore"
  value       = var.engine_type == "REDIS" ? google_redis_instance.redis[0].name : google_memcache_instance.memcached[0].name
}

output "instance_ip" {
  description = "Alamat IP dari instance Memorystore"
  value       = var.engine_type == "REDIS" ? google_redis_instance.redis[0].host : google_memcache_instance.memcached[0].node[0].host
}

output "instance_region" {
  description = "Wilayah instance Memorystore"
  value       = var.region
}
