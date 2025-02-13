## Untuk mendapatkan default service account email
data "google_project" "project_info" {
  project_id          = var.project_id
}

## Cek template default file
data "local_file" "default_sa_file" {
  filename = "default-sa.txt"
}

locals {
  default_sa     = split("\n", file("default-sa.txt"))
  default_sa_fix = [
    for sa in local.default_sa : replace(sa, "PROJECT_NUMBER", data.google_project.project_info.number)
  ]
  character_sa_fix = [
    for sa_fix in local.default_sa_fix : trimspace(replace(sa_fix, "\r", ""))
  ]

  character_sa_map = { for idx, sa in local.character_sa_fix : idx => sa }
}

resource "google_project_iam_member" "grant_compute_network_user" {
  for_each   = local.character_sa_map

  project    = var.project_host_id
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:${each.value}"
}

resource "google_project_iam_member" "grant_container_svc_agent" {
  project = var.project_host_id
  role    = "roles/container.serviceAgent"
  member  = "serviceAccount:service-${data.google_project.project_info.number}@container-engine-robot.iam.gserviceaccount.com"
}