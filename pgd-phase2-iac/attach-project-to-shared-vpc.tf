module "attach-project-to-shared-vpc" {
  source          = "../modules/project/attach-project-to-shared-vpc"
  project_host_id = var.project_host_id
  service_project = var.service_project
  depends_on      = [module.create-project]
}