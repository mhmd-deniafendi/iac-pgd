terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.18.1"
    }
  }
}

provider "google" {
  credentials = file("../service-account/interconnect-pegadaian-a99abbfe73b8.json")
  project     = var.project_id
  region      = var.region
}

## Provider google-beta untuk support GKE sandbox multitenant
provider "google-beta" {
  credentials = file("../service-account/interconnect-pegadaian-a99abbfe73b8.json")
  project     = var.project_id
  region      = var.region
}