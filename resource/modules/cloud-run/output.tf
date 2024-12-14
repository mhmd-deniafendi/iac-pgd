output "cloud_run_url" {
  description = "URL dari layanan Cloud Run"
  value       = google_cloud_run_service.service.status[0].url
}

output "ilb_ip" {
  description = "Alamat IP dari Internal Load Balancer"
  value       = google_compute_global_forwarding_rule.ilb.ip_address
}
