module "artifact-registry" {
  source = "../modules/std-resources/artifact-registry"
  location = var.location
  artifacts_repositories_dev = var.artifacts_repositories_dev
  artifacts_repositories_stg = var.artifacts_repositories_stg
  artifacts_repositories_prd = var.artifacts_repositories_prd
}