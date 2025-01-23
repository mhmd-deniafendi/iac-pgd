output "project_name" {
  description = "nama project"
  value       = module.create-project.project_name 
}

output "project_number" {
  description = "id project"
  value       = module.assign-default-rsc-sa.project_number
}

output "compute_engine_name" {
  description = "Nama compute engine yang telah dibuat"
  value       = module.compute-engine.instance_name
}

output "gke_cluster_name" {
  description = "nama gke cluster"
  value       = module.gke.gke_cluster_name
}

# output "cloud_sql_instance_name" {
#   description = "nama SQL instance"
#   value = module.cloud-sql.cloud_sql_instance_name
# }