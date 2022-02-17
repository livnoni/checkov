resource "google_bigquery_table" "fail" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "sheet"

  external_data_configuration {
    autodetect    = true
    source_format = "GOOGLE_SHEETS"

    google_sheets_options {
      skip_leading_rows = 1
    }

    source_uris = [
      "https://docs.google.com/spreadsheets/d/123456789012345",
    ]
  }
  labels = {
    yor_trace = "f59bdcb4-98ba-4544-bfd9-cc277ffe84ce"
  }
}


resource "google_bigquery_table" "pass" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "sheet"

  external_data_configuration {
    autodetect    = true
    source_format = "GOOGLE_SHEETS"

    google_sheets_options {
      skip_leading_rows = 1
    }

    source_uris = [
      "https://docs.google.com/spreadsheets/d/123456789012345",
    ]
  }

  encryption_configuration {
    kms_key_name = var.kms_key_name
  }
  labels = {
    yor_trace = "a3fad1fa-9709-47fc-ae79-e988cc2624a7"
  }
}