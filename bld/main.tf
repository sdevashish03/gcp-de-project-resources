# Raw Layer
resource "google_bigquery_dataset" "raw_dataset" {
  dataset_id = "employee_details_raw"
  location   = var.dataset_location

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "department_raw"
  schema     = file("C:/Users/adith/Documents/GitHub/My_Project_Resources/raw/employee_details_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "Employee_raw"
  schema     = file("C:/Users/adith/Documents/GitHub/My_Project_Resources/raw/employee_details_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "EmployeeDepartmentHistory_raw"
  schema     = file("C:/Users/adith/Documents/GitHub/My_Project_Resources/raw/employee_details_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "EmployeePayHistory_raw"
  schema     = file("C:/Users/adith/Documents/GitHub/My_Project_Resources/raw/employee_details_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

# Staging Layer
resource "google_bigquery_dataset" "staging_dataset" {
  dataset_id = "employee_details_satging"
  location   = var.dataset_location

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "staging_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "department_satging"
  schema     = file("C:/Users/adith/Documents/GitHub/My_Project_Resources/raw/employee_details_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "staging_table" {
  dataset_id = google_bigquery_dataset.staging_dataset.dataset_id
  table_id   = "Employee_satging"
  schema     = file("C:/Users/adith/Documents/GitHub/My_Project_Resources/raw/employee_details_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "staging_table" {
  dataset_id = google_bigquery_dataset.staging_dataset.dataset_id
  table_id   = "EmployeeDepartmentHistory_satging"
  schema     = file("C:/Users/adith/Documents/GitHub/My_Project_Resources/raw/employee_details_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "staging_table" {
  dataset_id = google_bigquery_dataset.staging_dataset.dataset_id
  table_id   = "EmployeePayHistory_satging"
  schema     = file("C:/Users/adith/Documents/GitHub/My_Project_Resources/raw/employee_details_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

# Curation Layer
resource "google_bigquery_dataset" "curation_dataset" {
  dataset_id = "employee_details_curation"
  location   = var.dataset_location

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "curation_table" {
  dataset_id = google_bigquery_dataset.curation_dataset.dataset_id
  table_id   = "department_curation"
  schema     = file("C:/Users/adith/Documents/GitHub/My_Project_Resources/raw/employee_details_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "curation_table" {
  dataset_id = google_bigquery_dataset.curation_dataset.dataset_id
  table_id   = "Employee_curation"
  schema     = file("C:/Users/adith/Documents/GitHub/My_Project_Resources/raw/employee_details_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "curation_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "EmployeeDepartmentHistory_curation"
  schema     = file("C:/Users/adith/Documents/GitHub/My_Project_Resources/raw/employee_details_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "curation_table" {
  dataset_id = google_bigquery_dataset.curation_dataset.dataset_id
  table_id   = "EmployeePayHistory_curation"
  schema     = file("C:/Users/adith/Documents/GitHub/My_Project_Resources/raw/employee_details_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}