output "sql_instance_name" {
  value = { for key, instance in google_sql_database_instance.cloud_sql : key => instance.name }
}