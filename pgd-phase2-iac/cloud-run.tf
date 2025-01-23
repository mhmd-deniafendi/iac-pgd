module "cloud-run" {
  source                 = "../modules/std-resources/cloud-run"
  location               = var.location
  ingress                = var.ingress
  cloud_run_services     = var.cloud_run_services
  traffic_type           = var.traffic_type
  percent                = var.percent
  depends_on             = [module.create-project,module.enable-svc-api]
}