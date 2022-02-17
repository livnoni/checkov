
resource "google_storage_bucket" "fail" {
  name     = "foo"
  location = "EU"

  versioning = {
    enabled = false
  }
  labels = {
    yor_trace = "3bede2ae-7a0b-4c4e-97fb-40a38454af72"
  }
}

resource "google_storage_bucket" "fail2" {
  name     = "foo"
  location = "EU"
  labels = {
    yor_trace = "9c5296b9-dd7a-4690-8c7d-3d309e38fbdb"
  }
}

resource "google_storage_bucket" "pass" {
  name     = "foo"
  location = "EU"

  versioning = {
    enabled = true
  }
  labels = {
    yor_trace = "3037654e-b71d-483e-b1c4-6eacf520d82b"
  }
}