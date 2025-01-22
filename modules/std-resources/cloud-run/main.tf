## Membuat job cloud run
resource "google_cloud_run_v2_service" "cr_svc" {
  for_each = { for service in var.cloud_run_services : service.name => service }

  name                = each.value.name
  location            = var.location
  deletion_protection = false
  ingress             = var.ingress

  template {
    containers {
      image = each.value.image
      resources {
        limits = {
          cpu    = each.value.cpu
          memory = each.value.memory
        }
      }
    }

    vpc_access {
      network_interfaces {
        network    = each.value.network
        subnetwork = each.value.subnetwork
      }
    }

    labels = {
      env : var.env
    }
  }

  traffic {
    type    = var.traffic_type
    percent = var.percent
  }
}