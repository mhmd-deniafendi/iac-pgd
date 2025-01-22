output "project_name" {
  description = "nama project"
  value       = module.create_project.project_name 
}

output "project_number" {
  description = "id project"
  value       = module.assign-default-rsc-sa.project_number
}

# output "network_name" {
#   description = "nama network (vpc)"
#   value       = module.compute-engine.network_name
# }

# output "subnetwork_name" {
#   description = "nama subnetwork"
#   value       = module.compute-engine.subnetwork_name
# }

output "gke_cluster_name" {
  description = "nama gke cluster"
  value       = module.gke.gke_cluster_name
}

# output "cloud_sql_instance_name" {
#   description = "nama SQL instance"
#   value = module.cloud-sql.cloud_sql_instance_name
# }