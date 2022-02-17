# pass

resource "google_storage_bucket" "pass" {
  name     = "example"
  location = "EU"

  logging {
    log_bucket = "other.com"
  }
  labels = {
    yor_trace = "2f76ea6e-6ce5-46a8-be31-2a3859296dd8"
  }
}

# fail

resource "google_storage_bucket" "fail" {
  name     = "example.com"
  location = "EU"

  logging {
    log_bucket = "example.com"
  }
  labels = {
    yor_trace = "8f1c6b69-1020-4cd6-831e-263b9045c5f1"
  }
}
