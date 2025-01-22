# Membuat beberapa Secret Manager
resource "google_secret_manager_secret" "secrets" {
  for_each = var.secrets

  secret_id = each.key
  replication {
    auto {}
  }

  labels = {
    env = var.env
  }
}

# Menambahkan versi ke setiap Secret
resource "google_secret_manager_secret_version" "secrets_version" {
  for_each    = var.secrets
  secret      = google_secret_manager_secret.secrets[each.key].id
  secret_data = each.value

  depends_on = [google_secret_manager_secret.secrets]
}