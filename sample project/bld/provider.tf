provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("C:/Users/devas/Service Account Json Keys/gcp-de-batch-sim-498a00a7aafc.json")
}