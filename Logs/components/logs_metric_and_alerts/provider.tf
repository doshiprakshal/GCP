terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }

    archive = {
      source  = "hashicorp/archive"
      version = "2.0.0"
    }
  }

  backend "gcs" {
    prefix = "alerting/"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
