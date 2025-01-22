module "create_project" {
  source          = "../modules/project/create-project"
  project_name    = var.project_name
  project_id      = var.project_id
  folder_id       = var.folder_id
  deletion_policy = var.deletion_policy
  billing_account = var.billing_account
}