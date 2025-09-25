variable "project_id" {
  description = "GCP Project ID"
  type = string
}

variable "region" {
  description = "GCP Region"
  type = string
}

variable "dataset_location" {
  description = "GCP Location"
  type = string
}

variable "credentials_file_path" {
    description = "Path to the GCP credentials file"
    type = string
  
  }

variable "gcs_bucket_name" {
  description = "GCS Bucket Name"
  type = string
  
}