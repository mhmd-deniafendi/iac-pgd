output "dataset_id" {
  description = "ID dari BigQuery Dataset"
  value       = google_bigquery_dataset.dataset.dataset_id
}

output "tables" {
  description = "Daftar tabel yang dibuat"
  value       = [for table in google_bigquery_table.table : table.table_id]
}
