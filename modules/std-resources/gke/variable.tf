variable "tenant" {
  default = ""
  type    = string
}

variable "tenant2" {
  default = ""
  type    = string
}

variable "project_host_id" {
  default = ""
  type    = string
}

variable "service_project" {
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

variable "cluster_name" {
  default = ""
  type    = string
}

variable "initial_node_count" {
  default = ""
  type    = string
}

variable "env" {
  default = ""
  type    = string
}

variable "instance_tags" {
  default = []
  type    = list(string)
}

variable "nodepool_name" {
  default = ""
  type    = string
}

variable "node_count" {
  default = ""
  type    = string
}

variable "machine_type" {
  default = ""
  type    = string
}