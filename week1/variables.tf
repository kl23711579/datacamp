variable "credentials" {
  description = "GCP credentials"
  default     = "./keys/gcp-keys.json"
}

variable "location" {
  description = "Location Name"
  default     = "australia-southeast1"
}

variable "bq_dataset_name" {
  description = "This is bq_dataset_name variable description"
  default     = "terraform_demo_de_terra_bigquery"
}

variable "gcs_bucket_name" {
  description = "my storage bucket name"
  default     = "terraform-demo-de-terra-bucket"
}

variable "gcs_storage_class" {
  description = "This is gcs storage class variable description"
  default     = "STANDARD"
}