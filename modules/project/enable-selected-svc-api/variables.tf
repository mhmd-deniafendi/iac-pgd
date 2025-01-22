variable "project_id" {
  default = ""
  type    = string
}

variable "services" {
  default =  [""]
  type    = list(string)
}