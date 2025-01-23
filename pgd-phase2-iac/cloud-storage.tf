module "cloud-storage" {
  source            = "../modules/std-resources/cloud-storage"
  bucket_properties = var.bucket_properties
  enable_versioning = var.enable_versioning
  env               = var.env
  retention_days    = var.retention_days
  # encryption_key    = var.encryption_key
  # cors              = var.cors
  depends_on        = [module.create-project,module.enable-svc-api]
}