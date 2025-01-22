module "enable-svc-api" {
  source      = "../modules/project/enable-selected-svc-api"
  project_id  = var.project_id
  services    = var.services
  depends_on  = [module.create_project]
}