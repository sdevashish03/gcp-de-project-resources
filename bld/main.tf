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
  schema     = file("C:/Users/devas/gcp-de-project-resources/bld/raw/Department_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "Employee_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "Employee_raw"
  schema     = file("C:/Users/devas/gcp-de-project-resources/bld/raw/Employee_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "EmployeeDepartmentHistory_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "EmployeeDepartmentHistory_raw"
  schema     = file("C:/Users/devas/gcp-de-project-resources/bld/raw/EmployeeDepartmentHistory_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "EmployeePayHistory_raw_table" {
  dataset_id = google_bigquery_dataset.raw_dataset.dataset_id
  table_id   = "EmployeePayHistory_raw"
  schema     = file("C:/Users/devas/gcp-de-project-resources/bld/raw/EmployeePayHistory_raw.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

# Staging Layer
resource "google_bigquery_dataset" "stg_dataset" {
  dataset_id = "Employee_Details_stg"
  location   = var.dataset_location

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "Department_stg_table" {
  dataset_id = google_bigquery_dataset.stg_dataset.dataset_id
  table_id   = "Department_stg"
  schema     = file("C:/Users/devas/gcp-de-project-resources/bld/staging/Department_stg.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "Employee_stg_table" {
  dataset_id = google_bigquery_dataset.stg_dataset.dataset_id
  table_id   = "Employee_stg"
  schema     = file("C:/Users/devas/gcp-de-project-resources/bld/staging/Employee_stg.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "EmployeeDepartmentHistory_stg_table" {
  dataset_id = google_bigquery_dataset.stg_dataset.dataset_id
  table_id   = "EmployeeDepartmentHistory_stg"
  schema     = file("C:/Users/devas/gcp-de-project-resources/bld/staging/EmployeeDepartmentHistory_stg.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "EmployeePayHistory_stg_table" {
  dataset_id = google_bigquery_dataset.stg_dataset.dataset_id
  table_id   = "EmployeePayHistory_stg"
  schema     = file("C:/Users/devas/gcp-de-project-resources/bld/staging/EmployeePayHistory_stg.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

# Curation Layer
resource "google_bigquery_dataset" "curation_dataset" {
  dataset_id = "Employee_Details_cur"
  location   = var.dataset_location

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_table" "curation_table" {
  dataset_id = google_bigquery_dataset.curation_dataset.dataset_id
  table_id   = "EmployeeDepartmentAndPayHistory_cur"
  schema     = file("C:/Users/devas/gcp-de-project-resources/bld/curation/EmployeeDepartmentAndPayHistory_cur.json") # Path to the JSON schema file

  lifecycle {
    prevent_destroy = false
  }
}

#Consumption Dataset
# This dataset is for analytical consumption views
 
resource "google_bigquery_dataset" "analytics_dataset" {
  dataset_id    = "Employee_Analytics"
  friendly_name = "Employee Analytics Dataset"
  description   = "Dataset for analytical consumption views"
  location      = var.dataset_location
}
#consumption Views
resource "google_bigquery_table" "vw_WorkforceDemographics" {
  dataset_id = google_bigquery_dataset.analytics_dataset.dataset_id
  table_id   = "vw_WorkforceDemographics"
 
  view {
    query          = <<EOF
    SELECT BusinessEntityID, JobTitle, DepartmentName, Gender, Age, TenureYears, IsActive
    FROM `gcp-de-batch-sim.Employee_Details_cur.EmployeeDepartmentAndPayHistory_cur`
    EOF
    use_legacy_sql = false
  }
}
 
resource "google_bigquery_table" "vw_CompensationTrends" {
  dataset_id = google_bigquery_dataset.analytics_dataset.dataset_id
  table_id   = "vw_CompensationTrends"
 
  view {
    query          = <<EOF
    SELECT BusinessEntityID, JobTitle, DepartmentName, Rate AS CurrentPayRate,
           PayFrequency, YearsSinceRateChange, RateChangeImpact, HourlyRate
    FROM `gcp-de-batch-sim.Employee_Details_cur.EmployeeDepartmentAndPayHistory_cur`
    EOF
    use_legacy_sql = false
  }
}
 
resource "google_bigquery_table" "vw_DepartmentStabilityMobility" {
  dataset_id = google_bigquery_dataset.analytics_dataset.dataset_id
  table_id   = "vw_DepartmentStabilityMobility"
 
  view {
    query          = <<EOF
    SELECT BusinessEntityID, JobTitle, DepartmentID, DepartmentName, StartDate AS DepartmentStartDate,
           DepartmentTenureYears, EndDate AS DepartmentExitDate, IsActive
    FROM `gcp-de-batch-sim.Employee_Details_cur.EmployeeDepartmentAndPayHistory_cur`
    EOF
    use_legacy_sql = false
  }
}
 
resource "google_bigquery_table" "vw_PayrollForecasting" {
  dataset_id = google_bigquery_dataset.analytics_dataset.dataset_id
  table_id   = "vw_PayrollForecasting"
 
  view {
    query          = <<EOF
    SELECT DepartmentName, COUNT(BusinessEntityID) AS EmployeeCount,
           SUM(HourlyRate * PayFrequency) AS TotalPayrollCost,
           AVG(HourlyRate) AS AvgHourlyPayRate
    FROM `gcp-de-batch-sim.Employee_Details_cur.EmployeeDepartmentAndPayHistory_cur`
    WHERE IsActive = TRUE
    GROUP BY DepartmentName
    EOF
    use_legacy_sql = false
  }
}

#ingestion metadata dataset
resource "google_bigquery_dataset" "metadata_dataset" {
  dataset_id    = "Ingestion_Metadata"
  description   = "Stores metadata related to data ingestion events"
  location      = "US"
}
 
#ingestion metadata table
resource "google_bigquery_table" "metadata_ingestion_log" {
  dataset_id = google_bigquery_dataset.metadata_dataset.dataset_id
  table_id   = "IngestionMetadataLogs"
  schema     = file("C:/Users/devas/gcp-de-project-resources/bld/metadata/IngestionMetadataLogs.json") # Path to the JSON schema file
  deletion_protection = false
 
  lifecycle {
  prevent_destroy = false
  }
}