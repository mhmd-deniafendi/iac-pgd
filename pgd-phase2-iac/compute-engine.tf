module "compute-engine" {
  source          = "../modules/std-resources/compute-engine"
  project_host_id = var.project_host_id
  region          = var.region
  zone            = var.zone
  service_count   = var.service_count
  service_project = var.service_project
  network_name    = var.network_name
  subnetwork_name = var.subnetwork_name
  instance_count  = var.instance_count
  instance_name   = var.instance_name
  instance_type   = var.instance_type
  instance_os     = var.instance_os
  instance_tags   = var.instance_tags
  env             = var.env
  disk_size       = var.disk_size
}