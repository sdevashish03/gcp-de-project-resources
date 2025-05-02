# Raw Layer
resource "google_bigquery_dataset" "raw_dataset" {
  dataset_id = "Employee_Details_raw"
  location   = var.dataset_location

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "Department_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "Department_raw"
  schema     = file("C:/Users/devas/OneDrive/CasaOne Data/GitHub/gcp-de-project-resources/bld/raw/Department_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "Employee_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "Employee_raw"
  schema     = file("C:/Users/devas/OneDrive/CasaOne Data/GitHub/gcp-de-project-resources/bld/raw/Employee_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "EmployeeDepartmentHistory_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "EmployeeDepartmentHistory_raw"
  schema     = file("C:/Users/devas/OneDrive/CasaOne Data/GitHub/gcp-de-project-resources/bld/raw/EmployeeDepartmentHistory_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "EmployeePayHistory_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "EmployeePayHistory_raw"
  schema     = file("C:/Users/devas/OneDrive/CasaOne Data/GitHub/gcp-de-project-resources/bld/raw/EmployeePayHistory_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

# Staging Layer
resource "google_bigquery_dataset" "employee_details_stg_dataset" {
  dataset_id = "Employee_Details_stg"
  location   = var.dataset_location

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "Department_stg_table" {
  dataset_id = google_bigquery_dataset.stg_dataset.dataset_id
  table_id   = "Department_stg"
  schema     = file("C:/Users/devas/OneDrive/CasaOne Data/GitHub/gcp-de-project-resources/bld/staging/Department_stg.json.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "Employee_stg_table" {
  dataset_id = google_bigquery_dataset.stg_dataset.dataset_id
  table_id   = "Employee_stg"
  schema     = file("C:/Users/devas/OneDrive/CasaOne Data/GitHub/gcp-de-project-resources/bld/staging/employee_stg.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "EmployeeDepartmentHistory_stg_table" {
  dataset_id = google_bigquery_dataset.stg_dataset.dataset_id
  table_id   = "EmployeeDepartmentHistory_stg"
  schema     = file("C:/Users/devas/OneDrive/CasaOne Data/GitHub/gcp-de-project-resources/bld/staging/EmployeeDepartmentHistory_stg.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "EmployeePayHistory_stg_table" {
  dataset_id = google_bigquery_dataset.stg_dataset.dataset_id
  table_id   = "EmployeePayHistory_stg"
  schema     = file("C:/Users/devas/OneDrive/CasaOne Data/GitHub/gcp-de-project-resources/bld/staging/EmployeePayHistory_stg.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

# # Curation Layer
# resource "google_bigquery_dataset" "curation_dataset" {
#   dataset_id = "Employee_Details_cur"
#   location   = var.dataset_location

#   lifecycle {
#     prevent_destroy = false
#   }
# }

# resource "google_bigquery_table" "curation_table" {
#   dataset_id = google_bigquery_dataset.curation_dataset.dataset_id
#   table_id   = "department_cur"
#   schema     = file("C:/Users/devas/OneDrive/CasaOne Data/GitHub/gcp-de-project-resources/bld/curation/Department_curation.json") # Path to the JSON schema file

#   lifecycle {
#     prevent_destroy = false
#   }
# }

# resource "google_bigquery_table" "curation_table" {
#   dataset_id = google_bigquery_dataset.curation_dataset.dataset_id
#   table_id   = "Employee_cur"
#   schema     = file("C:/Users/devas/OneDrive/CasaOne Data/GitHub/gcp-de-project-resources/bld/curation/employee_curation.json") # Path to the JSON schema file

#   lifecycle {
#     prevent_destroy = false
#   }
# }

# resource "google_bigquery_table" "curation_table" {
#   dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
#   table_id   = "EmployeeDepartmentHistory_cur"
#   schema     = file("C:/Users/devas/OneDrive/CasaOne Data/GitHub/gcp-de-project-resources/bld/curation/EmployeeDepartmentHistory_curation.json") # Path to the JSON schema file

#   lifecycle {
#     prevent_destroy = false
#   }
# }

# resource "google_bigquery_table" "curation_table" {
#   dataset_id = google_bigquery_dataset.curation_dataset.dataset_id
#   table_id   = "EmployeePayHistory_cur"
#   schema     = file("C:/Users/devas/OneDrive/CasaOne Data/GitHub/gcp-de-project-resources/bld/curation/EmployeePayHistory_curation.json") # Path to the JSON schema file

#   lifecycle {
#     prevent_destroy = false
#   }
# }