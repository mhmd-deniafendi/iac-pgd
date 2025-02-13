module "cloud-run" {
  source                 = "../modules/std-resources/cloud-run"
  location               = var.location
  region                 = var.region
  project_host_id        = var.project_host_id
  network_name           = var.network_name
  subnetwork_name        = var.subnetwork_name
  ingress                = var.ingress
  lb_name                = var.lb_name
  cloud_run_services     = var.cloud_run_services
  traffic_type           = var.traffic_type
  percent                = var.percent
  depends_on             = [module.create-project,module.enable-svc-api]
}