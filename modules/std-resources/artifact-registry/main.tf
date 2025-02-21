## Artifact Registry untuk environment dev
data "google_project" "dev-shr-svc" {
  project_id = "pgd-dev-shr-svc-db27f20d"
}

resource "google_artifact_registry_repository" "central-artifact-dev" {
  for_each      = { for repo in var.artifacts_repositories_dev : repo.name => repo if repo.name != "" }
  location      = var.location
  project       = data.google_project.dev-shr-svc.project_id
  repository_id = each.value.name
  description   = each.value.description
  format        = "DOCKER"
}

## Artifact Registry untuk environment staging
data "google_project" "stg-shr-svc" {
  project_id = "pgd-stg-shr-svc-2f44430b"
}

resource "google_artifact_registry_repository" "central-artifact-stg" {
  for_each      = { for repo in var.artifacts_repositories_stg : repo.name => repo if repo.name != ""}
  location      = var.location
  project       = data.google_project.stg-shr-svc.project_id
  repository_id = each.value.name
  description   = each.value.description
  format        = "DOCKER"
}

## Artifact Registry untuk environment production
data "google_project" "prd-shr-svc" {
  project_id = "pgd-prd-shr-svc-d5aed4a5"
}

resource "google_artifact_registry_repository" "central-artifact-prd" {
  for_each      = { for repo in var.artifacts_repositories_prd : repo.name => repo if repo.name != ""}
  location      = var.location
  project       = data.google_project.prd-shr-svc.project_id
  repository_id = each.value.name
  description   = each.value.description
  format        = "DOCKER"
}