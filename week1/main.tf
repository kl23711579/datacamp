

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.23.0"
    }
  }
}

provider "google" {
  # credentials = "./keys/gcp-keys.json"
  # or can use PATH
  # export GOOGLE_CREDENTIALS = "PATH/TO/KEY/JSON"
  credentials = file(var.credentials)
  project     = "terraform-demo-de"
  region      = var.location
  zone        = "australia-southeast1-a"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = var.gcs_bucket_name
  location      = var.location
  force_destroy = true
  storage_class = var.gcs_storage_class

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "bigquery_dataset_demo" {
  dataset_id    = var.bq_dataset_name
  friendly_name = "test"
  description   = "This is a test description"
  location      = var.location
}
