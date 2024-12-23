output "instance_name" {
  description = "Nama Cloud Spanner Instance"
  value       = google_spanner_instance.spanner_instance.name
}

output "database_name" {
  description = "Nama Cloud Spanner Database"
  value       = google_spanner_database.spanner_database.name
}
