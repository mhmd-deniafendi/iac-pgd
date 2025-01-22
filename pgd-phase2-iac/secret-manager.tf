module "secrets-manager" {
  source      = "../modules/std-resources/secret-manager"
  secrets     = var.secrets
  env         = var.env
}