
# Staging Layer
resource "google_bigquery_dataset" "staging_dataset" {
  dataset_id = "Employee_Details_staging"
  project    = var.project_id
  location   = var.dataset_location

  lifecycle {
    prevent_destroy = false
  }
}

#Create Tables in Stage Layer
resource "google_bigquery_table" "Department_staging_table" {
  dataset_id = google_bigquery_dataset.staging_dataset.dataset_id
  table_id   = "Department_staging"
  schema = file("${path.module}/schemas/department.json") # Path to the JSON schema file
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "Employee_staging_table" {
  dataset_id = google_bigquery_dataset.staging_dataset.dataset_id
  table_id   = "Employee_staging"
  schema    = file("${path.module}/schemas/employee.json") # Path to the JSON schema file
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "EmployeeDepartmentHistory_staging_table" {
  dataset_id = google_bigquery_dataset.staging_dataset.dataset_id
  table_id   = "EmployeeDepartmentHistory_staging"
  schema = file("${path.module}/schemas/employeedepartmenthistory.json") # Path to the JSON schema file
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "EmployeePayHistory_staging_table" {
  dataset_id = google_bigquery_dataset.staging_dataset.dataset_id
  table_id   = "EmployeePayHistory_staging"
  schema    = file("${path.module}/schemas/employeepayhistory.json") # Path to the JSON schema file
  lifecycle {
    prevent_destroy = false
  }
}