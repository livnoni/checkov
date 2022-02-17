# pass

resource "google_storage_bucket" "enabled" {
  name     = "example"
  location = "EU"

  uniform_bucket_level_access = True
  labels = {
    yor_trace = "d5bf7ddd-1a02-43a7-904b-d36015d88f3d"
  }
}

# fail

resource "google_storage_bucket" "default" {
  name     = "example.com"
  location = "EU"
  labels = {
    yor_trace = "610f9e61-8230-4b14-905b-e6480303d3a2"
  }
}

resource "google_storage_bucket" "disabled" {
  name     = "example"
  location = "EU"

  uniform_bucket_level_access = False
  labels = {
    yor_trace = "0405deb1-be84-4f48-98fd-f845842411e6"
  }
}
