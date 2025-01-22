## Variable untuk shared VPC
variable "shared_vpc_project" {
  default     = ""
  type        = string
  description = "variable project untuk shared vpc"
}

variable "shared_vpc_name" {
  default     = ""
  type        = string
  description = "variable nama vpc untuk project shared VPC"
}

## Variable untuk general
variable "region" {
  default     = ""
  type        = string
  description = "value region untuk general"
}

variable "zone" {
  default   = ""
  type      = string
}

## Variable untuk project
variable "project_name" {
  default     = ""
  type        = string
  description = "variable untuk nama project"
}

variable "project_id" {
  default     = ""
  type        = string
  description = "variable untuk id project"
}

variable "folder_id" {
  default     = ""
  type        = string
  description = "Folder id jika project akan di masukan ke folder tertentu"
}

variable "billing_account" {
  default     = ""
  type        = string
  description = "Billing account id"
}

variable "deletion_policy" {
  default     = ""
  type        = string
  description = "Deletion policy untuk project, contoh: PREVENT, ABANDON, DELETE"
}

## Variable untuk mengaktifkan api svc
variable "services" {
  default     = []
  type        = list(any)
  description = "url googleapis service, contoh: compute.googleapis.com"
}

## Variable untuk resource quota
variable "parent_project_name" {
  default     = ""
  type        = string
  description = "Parent dari nama project, contoh: projects/90977307766"
}

variable "resource_name_quota_pref" {
  default     = ""
  type        = string
  description = "nama resource name quota"
}

variable "service_name_quota" {
  default     = ""
  type        = string
  description = "Url googleapis contoh sama dengan value services"
}

variable "quota_id" {
  default     = ""
  type        = string
  description = "Quota id, contoh: CPUS-per-project-region"
}

variable "value_quota" {
  default     = ""
  type        = string
  description = "Total value quota yang akan di set"
}

## Variable untuk assign default resrouce service account
# variable "members" {
#   default     = ""
#   type        = string
#   description = "email account atau service account default untuk ditambahkan di network shared VPC project"
# }

variable "all_subnets" {
  default     = []
  type        = list(string)
  description = "list semua subnets di shared VPC project untuk di izinkan ke project yang sudah kita buat"
}

## Variable untuk compute engine dengan menggunakan shared VPC
variable "project_host_id" {
  default     = ""
  type        = string
  description = "nama variable untuk jumlah yang service yang akan dibuat"
}

variable "service_count" {
  default     = ""
  type        = string
  description = "nama variable untuk jumlah yang service yang akan dibuat"
}

variable "service_project" {
  default     = ""
  type        = string
  description = "nama variable untuk id project service"
}

variable "network_name" {
  default     = ""
  type        = string
  description = "nama variable untuk nama network (vpc)"
}

variable "subnetwork_name" {
  default     = ""
  type        = string
  description = "nama variable untuk nama subnetwork"
}

variable "instance_count" {
  default     = ""
  type        = string
  description = "nama variable untuk jumlah compute engine yang akan dibuat"
}

variable "instance_name" {
  default     = ""
  type        = string
  description = "nama variable untuk nama compute engine yang akan dibuat"
}

variable "instance_type" {
  default     = ""
  type        = string
  description = "nama variable untuk type compute engine yang akan dibuat"
}

variable "instance_tags" {
  default     = []
  type        = list(string)
  description = "nama variable untuk tags compute engine yang akan dibuat"
}

variable "instance_os" {
  default     = ""
  type        = string
  description = "nama variable untuk os compute engine yang akan dibuat"
}

variable "disk_size" {
  default     = ""
  type        = string
  description = "nama variable untuk besaran disk compute engine yang akan dibuat"
}

## Variable untuk GKE Cluster
variable "gke_cluster_name" {
  default     = ""
  type        = string
  description = "variable untuk nama gke cluster"
}

variable "cluster_gke_region" {
  default     = ""
  type        = string
  description = "variable untuk gke cluster region"
}

variable "initial_node_count" {
  default     = ""
  type        = string
  description = "variable untuk jumlah node gke cluster"
}

variable "private_subnetwork_name" {
  default     = ""
  type        = string
}

variable "gke_machine_type" {
  default     = ""
  type        = string
  description = "variable untuk machine type gke cluster"
}

## Variable untuk GKE
variable "tenant" {
  default     = ""
  type        = string
  description = "variable untuk nama gke multi tenant"
}

variable "tenant2" {
  default     = ""
  type        = string
  description = "variable untuk nama gke multi tenant2"
}

variable "cluster_name" {
  default     = ""
  type        = string
  description = "variable untuk nama gke cluster"
}

variable "nodepool_name" {
  default     = ""
  type        = string
  description = "variable untuk nama node pool"
}

variable "node_count" {
  default     = ""
  type        = string
  description = "variable untuk nama jumlah node pool yang akan dibuat"
}

variable "machine_type" {
  default     = ""
  type        = string
  description = "variable untuk type machine nodepool yang akan dibuat"
}

variable "labels" {
  default     = ""
  type        = string
  description = "variable untuk label nodepools"
}

## Variable untuk cloud storage
variable "bucket_properties" {
  default = []
  type = list(object({
    name          = string
    location      = string #Lokasi bucket (misalnya US, ASIA, EUROPE)
    storage_class = string #Kelas penyimpanan bucket (STANDARD, NEARLINE, COLDLINE, ARCHIVE)
    force_destroy = bool
  }))
  description = "Nama bucket, lokasi dan storage class untuk cloud storage"
}

variable "location" {
  description = "Lokasi bucket (misalnya US, ASIA, EUROPE)"
  type        = string
  default     = "US"
}

variable "enable_versioning" {
  description = "Apakah versi objek diaktifkan untuk bucket"
  type        = bool
  default     = false
}

variable "env" {
  description = "label untuk environment"
  type        = string
  default     = ""
}

variable "retention_days" {
  description = "Berapa hari objek akan disimpan sebelum dihapus"
  type        = number
  default     = 0
}

variable "encryption_key" {
  description = "Kunci enkripsi KMS untuk bucket (opsional)"
  type        = string
  default     = null
}

variable "cors" {
  description = <<EOT
Pengaturan CORS untuk bucket (opsional).
Contoh:
[
  {
    origin          = ["*"]
    method          = ["GET", "POST"]
    response_header = ["Content-Type"]
    max_age_seconds = 3600
  }
]
EOT
  type        = list(object({
    origin          = list(string)
    method          = list(string)
    response_header = list(string)
    max_age_seconds = number
  }))
  default     = null
}

## Variable untuk secret manager
variable "secrets" {
  default     = {}
  type        = map(string)
  description = "Menentukan secret yang akan dibuat contoh, dbhost : pgd-test-db"
}

## Variable untuk cloud sql
variable "db_instances_properties" {
  default = []
  type    = list(object({
    name              = string
    database_version  = string
    tier              = string
    availability_type = string
    sql_disk_type     = string
    sql_disk_size     = string
  }))
  description = "Menentukan value untuk sql database instance, seperti: nama sql instance, tipe database, tier dll"
}

variable "authorized_networks" {
  default = []
  type    = list(object({
    name  = string
    cidr  = string
  }))
  description = "Value untuk nama network dan network yang akan di izinkan untuk mengakses cloud SQL"
}

## Variable untuk cloud run
variable "ingress" {
  default     = ""
  type        = string
  description = "Tipe ingress yang akan digunakan untuk cloud run"
}

variable "cloud_run_services" {
  default = []
  type = list(object({
    name       = string
    image      = string
    cpu        = string
    memory     = string
    network    = string
    subnetwork = string
  }))
  description = "Nama,image,cpu,memory,network dan subnetwork service/app cloud run"
}

variable "traffic_type" {
  default     = ""
  type        = string
  description = "Tipe traffic yang akan digunakan untuk cloud run"
}

variable "percent" {
  default     = null
  type        = number
  description = "Persentase traffic pada cloud run yang sudah di deploy"
}