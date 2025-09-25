
# Raw Layer
resource "google_bigquery_dataset" "raw_dataset" {
  dataset_id = "Employee_Details_raw"
  project    = var.project_id
  location   = var.dataset_location

  lifecycle {
    prevent_destroy = false
  }
}

#Create Tables in Raw Layer
resource "google_bigquery_table" "Department_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "Department_raw"
  schema = file("${path.module}/schemas/department.json") # Path to the JSON schema file
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "Employee_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "Employee_raw"
  schema    = file("${path.module}/schemas/employee.json") # Path to the JSON schema file
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "EmployeeDepartmentHistory_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "EmployeeDepartmentHistory_raw"
  schema = file("${path.module}/schemas/employeedepartmenthistory.json") # Path to the JSON schema file
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "EmployeePayHistory_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "EmployeePayHistory_raw"
  schema    = file("${path.module}/schemas/employeepayhistory.json") # Path to the JSON schema file
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_storage_bucket" "buckets" {
  
  name     = var.gcs_bucket_name
  location = var.region
  project  = var.project_id

  uniform_bucket_level_access = true

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
}