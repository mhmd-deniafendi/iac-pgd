module "gke" {
  source              = "../modules/std-resources/gke"
  project_host_id     = var.project_host_id
  service_project     = var.service_project
  region              = var.region
  cluster_name        = var.cluster_name
  initial_node_count  = var.initial_node_count
  env                 = var.env
  instance_tags       = var.instance_tags
  nodepool_name       = var.nodepool_name
  node_count          = var.node_count
  machine_type        = var.machine_type
  tenant              = var.tenant
  tenant2             = var.tenant2
  network_name        = var.network_name
  subnetwork_name     = var.subnetwork_name
  depends_on          = [module.create-project,module.enable-svc-api]
}