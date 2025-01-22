module "resource-quota" {
  source                    = "../modules/project/resource-quota"
  parent_project_name       = var.parent_project_name
  resource_name_quota_pref  = var.resource_name_quota_pref
  service_name_quota        = var.service_name_quota
  quota_id                  = var.quota_id 
  value_quota               = var.value_quota
  region                    = var.region
  depends_on                = [module.enable-svc-api]
}