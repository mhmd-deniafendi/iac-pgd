variable "location" {
  default = ""
  type    = string
}

variable "artifacts_repositories_dev" {
  default = []
  type    = list(object({
    name        = string
    description = optional(string,"")
  }))
}

variable "artifacts_repositories_stg" {
  default = []
  type    = list(object({
    name        = string
    description = optional(string,"")
  }))
}

variable "artifacts_repositories_prd" {
  default = []
  type    = list(object({
    name        = string
    description = optional(string,"")
  }))
}