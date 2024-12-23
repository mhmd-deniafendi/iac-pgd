output "instance_name" {
  description = "Nama instance Filestore"
  value       = google_filestore_instance.filestore_instance.name
}

output "instance_ip" {
  description = "Alamat IP instance Filestore"
  value       = google_filestore_instance.filestore_instance.networks[0].ip_addresses[0]
}

output "instance_capacity" {
  description = "Kapasitas penyimpanan instance Filestore (GB)"
  value       = google_filestore_instance.filestore_instance.file_shares[0].capacity_gb
}
