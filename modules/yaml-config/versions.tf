terraform {
  required_version = ">= 0.13.0"

  required_providers {
    template = {
      source  = "cloudposse/template"
      version = ">= 2.2"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 2.0"
    }
    utils = {
      source  = "cloudposse/utils"
      version = "1.24.0"
    }
  }
}
