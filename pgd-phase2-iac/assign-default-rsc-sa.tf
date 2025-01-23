module "assign-default-rsc-sa" {
  source          = "../modules/project/assign-default-rsc-sa"
  project_id      = var.project_id
  project_host_id = var.project_host_id
  depends_on      = [module.create-project]
}