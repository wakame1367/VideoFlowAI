terraform {
  required_version = ">= 1.9.4, < 2.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.41.0"
    }
  }
  backend "gcs" {
    bucket = "${var.project_name}-tfstate-backend"
    prefix = var.project_name
  }
}
