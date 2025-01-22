terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.14.1"
    }
  }
}

provider "google" {
  credentials   = file("../service-account/interconnect-pegadaian-a99abbfe73b8.json")
  project       = var.project_id
  region        = var.region
}