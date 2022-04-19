terraform {
  required_version = ">= 0.13.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 1.3"
    }
    template = {
      source  = "hashicorp/template"
      version = ">= 2.2"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 2.0"
    }
    utils = {
      source = "cloudposse/utils"
      version = ">= 0.3.0"
    }
  }
}
