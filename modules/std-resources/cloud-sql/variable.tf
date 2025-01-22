variable "db_instances_properties" {
  default = []
  type = list(object({
    name              = string
    database_version  = string
    tier              = string
    availability_type = string
    sql_disk_type     = string
    sql_disk_size     = string
  }))
}

variable "project_id" {
  default = ""
  type    = string
}

variable "project_host_id" {
  default = ""
  type    = string
}

variable "network_name" {
  default = ""
  type    = string
}

variable "subnetwork_name" {
  default = ""
  type    = string
}

variable "region" {
  default = ""
  type    = string
}

variable "env" {
  default = ""
  type = string
}

variable "authorized_networks" {
  default = []
  type    = list(object({
    name  = string
    cidr  = string
  }))
}