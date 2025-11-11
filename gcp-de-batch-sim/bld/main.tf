# Raw Dataset
resource "google_bigquery_dataset" "raw_dataset" {
  dataset_id = "Employee_Details_raw"
  location   = var.dataset_location

  lifecycle {
    prevent_destroy = false
  }
}

# Raw Tables
resource "google_bigquery_table" "Department_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "Department_raw"
  schema     = file("${path.module}/raw/Department_raw.json") # Path to the JSON schema file
  deletion_protection = false

  lifecycle {
    prevent_destroy = false
  }
}
resource "google_bigquery_table" "Employee_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "Employee_raw"
  schema     = file("${path.module}/raw/Employee_raw.json") # Path to the JSON schema file
  deletion_protection = false

  lifecycle {
    prevent_destroy = false
  }
}

# Staging Dataset
resource "google_bigquery_dataset" "staging_dataset" {
  dataset_id = "Employee_Details_stg"
  location   = var.dataset_location

  lifecycle {
    prevent_destroy = false
  }
}

#Staging Tables
resource "google_bigquery_table" "Department_stg_table" {
  dataset_id = google_bigquery_dataset.staging_dataset.dataset_id
  table_id   = "Department_stg"
  schema     = file("${path.module}/staging/Department_stg.json") # Reusing the same schema file
  deletion_protection = false

  lifecycle {
    prevent_destroy = false
  }
}
resource "google_bigquery_table" "Employee_stg_table" {
  dataset_id = google_bigquery_dataset.staging_dataset.dataset_id
  table_id   = "Employee_stg"
  schema     = file("${path.module}/staging/Employee_stg.json") # Reusing the same schema file
  deletion_protection = false

  lifecycle {
    prevent_destroy = false
  }
}

# Curation Dataset
resource "google_bigquery_dataset" "curation_dataset" {
  dataset_id = "Employee_Details_cur"
  location   = var.dataset_location

  lifecycle {
    prevent_destroy = false
  }
}

# Curation Tables
resource "google_bigquery_table" "curation_table" {
  dataset_id = google_bigquery_dataset.curation_dataset.dataset_id
  table_id   = "EmployeeDepartment_cur"
  schema     = file("${path.module}/curation/EmployeeDepartment_cur.json") # Path to the JSON schema file
  deletion_protection = false
  lifecycle {
    prevent_destroy = false
  }
}

#ingestion metadata dataset
resource "google_bigquery_dataset" "metadata_dataset" {
  dataset_id    = "Ingestion_Metadata"
  description   = "Stores metadata related to data ingestion events"
  location      = var.dataset_location
}

#ingestion metadata table
resource "google_bigquery_table" "metadata_ingestion_log" {
  dataset_id = google_bigquery_dataset.metadata_dataset.dataset_id
  table_id   = "IngestionMetadataLogs"
  schema     = file("${path.module}/metadata/IngestionMetadataLogs.json") # Path to the JSON schema file
  deletion_protection = false

  lifecycle {
  prevent_destroy = false
  }
}