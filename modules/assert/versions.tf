terraform {
  required_version = ">= 0.13.0"

  required_providers {
    external = {
      source  = "hashicorp/external"
      version = ">= 2.3.2"
    }
  }
}
