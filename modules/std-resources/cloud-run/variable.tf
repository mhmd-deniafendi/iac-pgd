variable "env" {
  default = ""
  type    = string
}

variable "location" {
  default = ""
  type    = string
}

variable "region" {
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

variable "project_host_id" {
  default = ""
  type    = string
}

variable "ingress" {
  default = ""
  type    = string
}

variable "lb_name" {
  default = ""
  type    = string
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
}

variable "traffic_type" {
  default = ""
  type    = string
}

variable "percent" {
  default = null
  type    = number
}