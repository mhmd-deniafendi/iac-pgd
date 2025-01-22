## Untuk menentukan project quota
resource "google_cloud_quotas_quota_preference" "preference" {
  ## contoh: projects/my-project-name
  parent     = var.parent_project_name
  name       = var.resource_name_quota_pref
  service    = var.service_name_quota
  quota_id   = var.quota_id
  dimensions = {"region" : var.region}
  quota_config {
    preferred_value = var.value_quota
  }
}