output "instance_name" {
  description = "Nama Cloud SQL Instance"
  value       = google_sql_database_instance.cloud_sql.name
}

output "instance_connection_name" {
  description = "Nama koneksi instance untuk aplikasi"
  value       = google_sql_database_instance.cloud_sql.connection_name
}

output "public_ip_address" {
  description = "Alamat IP publik dari Cloud SQL Instance (jika diaktifkan)"
  value       = google_sql_database_instance.cloud_sql.public_ip_address
}

output "databases" {
  description = "Daftar nama database yang dibuat"
  value       = [for db in google_sql_database.databases : db.name]
}
