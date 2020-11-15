terraform {
  required_version = ">= 0.12.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 1.3"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 2.0"
    }
  }
}
