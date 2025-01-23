module "cloud-sql" {
  source                  = "../modules/std-resources/cloud-sql"
  project_id              = var.project_id
  project_host_id         = var.project_host_id
  network_name            = var.network_name
  subnetwork_name         = var.subnetwork_name
  region                  = var.region
  env                     = var.env
  db_instances_properties = var.db_instances_properties
  authorized_networks     = var.authorized_networks
  depends_on              = [module.create-project,module.enable-svc-api]
}