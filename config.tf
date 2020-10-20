provider "google" {
  region  = var.region
  version = ">= 3.0.0"
}
terraform {
  required_version = "~> 0.13.2"
  backend "gcs" {}
}