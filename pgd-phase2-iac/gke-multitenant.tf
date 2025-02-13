module "gke-multitenant" {
  source                          = "../modules/std-resources/gke-multitenant"
  project_host_id                 = var.project_host_id
  service_project                 = var.service_project
  region                          = var.region
  zone                            = var.zone
  cluster_name                    = var.cluster_name
  pod_secondary_ip_range_name     = var.pod_secondary_ip_range_name
  service_secondary_ip_range_name = var.service_secondary_ip_range_name
  initial_node_count              = var.initial_node_count
  env                             = var.env
  node_count                      = var.node_count
  network_name                    = var.network_name
  subnetwork_name                 = var.subnetwork_name
  node_pools                      = var.node_pools
  depends_on                      = [module.create-project,module.attach-project-to-shared-vpc,module.enable-svc-api,module.assign-default-rsc-sa]
}