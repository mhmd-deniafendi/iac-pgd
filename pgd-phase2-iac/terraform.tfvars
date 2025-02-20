### Value general
region          = "asia-southeast2"
zone            = "asia-southeast2-a"
env             = "dev"

### Value untuk project
project_name    = "pgd-dev-iac-ckidtf"
project_id      = "pgd-dev-iac-ckidtf"
folder_id       = "folders/898970906005"
billing_account = "xxxxxx-xxxxxx-xxxxxx"
deletion_policy = "DELETE"

### Value untuk attach project ke shared vpc project
project_host_id = "pgd-dev-shr-net-8af7114c"
service_project = "pgd-dev-iac-ckidtf" ## harus sama dengan project id

### Value untuk enable api svc
services        = [
  "container.googleapis.com",
  "run.googleapis.com"
  # "storage-api.googleapis.com",
  # "logging.googleapis.com",
  # "cloudquotas.googleapis.com",
  # "storage.googleapis.com",
  # "sqladmin.googleapis.com",
  # "dataflow.googleapis.com"
]

### Value untuk assign default sa ke shared VPC project
all_subnets = [ "pgd-dev-snet", "pgd-dev-snet-lb", "pgd-dev-snet-prx" ] ## list semua subnet yang ada di shared VPC subnet

### Value untuk resource quota
parent_project_name         = "projects/90977307766"
resource_name_quota_pref    = "compute_googleapis_com-memory-per-project"
service_name_quota          = "compute.googleapis.com"
quota_id                    = "memory-per-project-region"
value_quota                 = "200"

### Value untuk network dan subnetwork shared VPC
network_name    = "pgd-dev-svpc"
subnetwork_name = "pgd-dev-snet"

### Value untuk compute engine
instance_count  = "2"
instance_name   = "pgd-compute-test"
instance_type   = "e2-small"
instance_os     = "ubuntu-2004-lts"
instance_tags   = [ "env", "bu" ]
disk_size       = "30" ##(GB)


### Value untuk GKE cluster dan GKE multi tenant 
cluster_name                    = "pgd-dev-ckidtest"
cluster_gke_region              = "asia-southeast2"
initial_node_count              = "1"
pod_secondary_ip_range_name     = "pgd-dev-svpc-gkepod-01"
service_secondary_ip_range_name = "pgd-dev-svpc-gkesvc-01"
##### Value untuk GKE nodepool non multitenant
nodepool_name      = "nodepool-test-gke"
node_count         = "1"
machine_type       = "n1-standard-4"

### Value untuk GKE nodepool multi tenant
node_pools = {
  "general-nodepool" = {
    node_count    = "1"
    machine_type  = "e2-medium"
    enable_gvisor = false
    labels = {}
    disk_size_gb  = 30 ## Min 10 max 100
    disk_type     = "pd-standard" ## (contoh:'pd-standard', 'pd-balanced' or 'pd-ssd')
  },
  "sandbox-nodepool" = {
    node_count    = "1"
    machine_type  = "n1-standard-4"
    enable_gvisor = true
    labels = {
      "app" = "crm"
    }
    disk_size_gb  = 30 ## Min 10 max 100
    disk_type     = "pd-standard" ## (contoh:'pd-standard', 'pd-balanced' or 'pd-ssd')
  }
}

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
    cidr  = "192.168.0.1/32"
  }
]

### Contoh value untuk cloud run
ingress = "INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER" ## value yang valid: INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER, INGRESS_TRAFFIC_ALL, INGRESS_TRAFFIC_INTERNAL_ONLY
lb_name = "ckid-test-ilb"
cloud_run_services = [
  {
    name       = "ckid-test"
    image      = "us-docker.pkg.dev/cloudrun/container/hello"
    cpu        = "1" ## contoh: 2
    memory     = "512Mi" ## contoh: 265Mi
    network    = "pgd-dev-svpc"
    subnetwork = "pgd-dev-snet"
  }
]
location     = "asia-southeast2"
percent      = 100
traffic_type = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"