resource "google_data_fusion_instance" "fail" {
  provider                      = google-beta
  name                          = "my-instance"
  description                   = "My Data Fusion instance"
  region                        = "us-central1"
  type                          = "BASIC"
  enable_stackdriver_logging    = true
  enable_stackdriver_monitoring = true
  labels = {
    example_key = "example_value"
    yor_trace   = "25f9f2b4-5a05-4ddf-94da-b570e8e1e652"
  }
  network_config {
    network       = "default"
    ip_allocation = "10.89.48.0/22"
  }
  version                  = "6.3.0"
  dataproc_service_account = data.google_app_engine_default_service_account.default.email
}

resource "google_data_fusion_instance" "pass" {
  provider                      = google-beta
  name                          = "my-instance"
  description                   = "My Data Fusion instance"
  region                        = "us-central1"
  type                          = "BASIC"
  enable_stackdriver_logging    = true
  enable_stackdriver_monitoring = true
  labels = {
    example_key = "example_value"
    yor_trace   = "0ef2af7a-16dd-4b27-81a6-672868508803"
  }
  private_instance = true
  network_config {
    network       = "default"
    ip_allocation = "10.89.48.0/22"
  }
  version                  = "6.3.0"
  dataproc_service_account = data.google_app_engine_default_service_account.default.email
}