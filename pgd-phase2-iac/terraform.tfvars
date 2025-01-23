### Value general
region          = "asia-southeast2"
zone            = "asia-southeast2-a"
env             = "dev"

### Value untuk project
project_name    = "pgd-dev-ckid-iac"
project_id      = "pgd-dev-ckid-iac"
folder_id       = "folders/898970906005"
billing_account = "0156C8-36A651-D54AD0"
deletion_policy = "DELETE"

### Value untuk enable api svc
services        = [
  "monitoring.googleapis.com",
  "storage-api.googleapis.com",
  "logging.googleapis.com",
  "cloudquotas.googleapis.com",
  "storage.googleapis.com",
  "sqladmin.googleapis.com",
  "run.googleapis.com"
]

### Value untuk assign default sa ke shared VPC project
all_subnets = [ "pgd-dev-snet", "pgd-dev-snet-lb", "pgd-dev-snet-prx" ] ## list semua subnet yang ada di shared VPC subnet

### Value untuk resource quota
parent_project_name         = "projects/90977307766"
resource_name_quota_pref    = "compute_googleapis_com-memory-per-project"
service_name_quota          = "compute.googleapis.com"
quota_id                    = "memory-per-project-region"
value_quota                 = "200"

### Value untuk compute engine
project_host_id = "pgd-dev-shr-net-8af7114c"
service_count   = "1"
service_project = "pgd-dev-ckid-iac" ## project id
network_name    = "pgd-dev-svpc"
subnetwork_name = "pgd-dev-snet"
instance_count  = "2"
instance_name   = "pgd-compute-test"
instance_type   = "e2-small"
instance_os     = "ubuntu-2004-lts"
instance_tags   = [ "env", "bu" ]
disk_size       = "30" ##(GB)


### Value untuk gke cluster
cluster_name       = "gke-pgd-test"
cluster_gke_region = "asia-southeast2"
initial_node_count = "1"
nodepool_name      = "nodepool-test-gke"
node_count         = "2"
machine_type       = "e2-medium"
labels             = "dev"
tenant             = "finance"
tenant2            = "HR"

### Contoh value untuk cloud storage
bucket_properties = [ 
  {
    name          = "pgd-bucket-test"
    location      = "ASIA" ## contoh lokasi bucket (ASIA, US, EUROPE)
    storage_class = "STANDARD" ## contoh storage class (STANDARD, NEARLINE, COLDLINE, ARCHIVE)
    force_destroy = true
  },
  {
    name          = "pgd-bucket-test2"
    location      = "ASIA"
    storage_class = "STANDARD"
    force_destroy = true
  }
]
enable_versioning   = false
retention_days      = 30
# encryption_key      = "value"
# cors = [ {
#   origin = [ "*" ]
# } ]

### Value untuk secret manager
secrets = {
  "dbusername" = "admin",
  "dbpassword" = "123qwe!@#QWE"
}

### Value untuk cloud sql
db_instances_properties = [
  {
    name              = "pgd-sql-test"
    database_version  = "POSTGRES_17" ## contoh: POSTGRES_17
    tier              = "db-perf-optimized-N-2"
    availability_type = "REGIONAL" ## contoh: "REGIONAL" atau "ZONAL"
    sql_disk_type     = "PD_SSD" ## contoh: Tipe disk (PD_SSD atau PD_HDD)
    sql_disk_size     = "30" ## (GB)
  }
]

authorized_networks = [
  {
    name  = "Test Network auth"
    cidr  = "182.0.215.187/32"
  }
]

### Value untuk cloud run
ingress = "INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER" ## value yang valid: INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER, INGRESS_TRAFFIC_ALL, INGRESS_TRAFFIC_INTERNAL_ONLY
cloud_run_services = [
  {
    name       = "cloud-run-test"
    image      = "gcr.io"
    cpu        = "2" ## contoh: 2
    memory     = "265Mi" ## contoh: 265Mi
    network    = "pgd-dev-svpc"
    subnetwork = "pgd-dev-snet"
  }
]
location     = "asia-southeast2"
percent      = 100
traffic_type = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"