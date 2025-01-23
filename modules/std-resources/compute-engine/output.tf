output "instance_name" {
  value = [for inst in google_compute_instance.instance : inst.name]
  description = "Nama compute instance yang telah dibuat"
}