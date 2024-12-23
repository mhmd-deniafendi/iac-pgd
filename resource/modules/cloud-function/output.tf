output "function_name" {
  description = "Nama Cloud Function"
  value       = google_cloudfunctions_function.cloud_function.name
}

output "function_url" {
  description = "URL untuk memanggil fungsi (jika menggunakan HTTP trigger)"
  value       = google_cloudfunctions_function.cloud_function.https_trigger[0].url
}
