variable "project_host_id" {
  default   = ""
  type      = string
}

variable "service_count" {
  default   = ""
  type      = string
}

variable "service_project" {
  default   = ""
  type      = string
}

variable "network_name" {
  default   = ""
  type      = string
}

variable "region" {
  default   = ""
  type      = string
}

variable "subnetwork_name" {
  default   = ""
  type      = string
}

variable "instance_count" {
  default   = ""
  type      = string
}

variable "instance_name" {
  default   = ""
  type      = string
}

variable "instance_os" {
  default   = ""
  type      = string
}

variable "instance_type" {
  default   = ""
  type      = string
}

variable "instance_tags" {
  default   = []
  type      = list(string)
}

variable "env" {
  default = ""
  type    = string
}

variable "zone" {
  default   = ""
  type      = string
}

variable "disk_size" {
  default   = ""
  type      = string
}