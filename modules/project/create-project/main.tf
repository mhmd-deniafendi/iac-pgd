## Untuk membuat project di spesific/existing folder
resource "google_project" "my_project" {
  name                = var.project_name
  project_id          = var.project_id
  folder_id           = var.folder_id
  auto_create_network = false
  billing_account     = var.billing_account
  deletion_policy     = var.deletion_policy
}
