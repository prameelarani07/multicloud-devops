
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "google" {
  project = "project-0062eb83-fa81-421f-a0f"
  region  = "us-central1"
  zone    = "us-central1-a"
}
