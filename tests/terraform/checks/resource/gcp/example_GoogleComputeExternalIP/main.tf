
resource "google_compute_instance" "fail" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk {
    auto_delete = true
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
  labels = {
    yor_trace = "8141a1ae-43d2-4093-b9bc-ad0e48590667"
  }
}


resource "google_compute_instance_template" "fail" {
  name         = "test"
  machine_type = "n1-standard-1"

  disk {}
  network_interface {
    network = "default"
    access_config {

    }
  }
  labels = {
    yor_trace = "dd4122e8-71c4-4e74-9153-30b2853a92f0"
  }
}


resource "google_compute_instance_from_template" "fail" {
  name                     = "test"
  source_instance_template = google_compute_instance_template.pass.id
  labels = {
    yor_trace = "114422d2-3842-4b80-96cb-9ec5122fdcf0"
  }
}

resource "google_compute_instance" "pass" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk {
    auto_delete = true
  }
  network_interface {

  }
  labels = {
    yor_trace = "e20e0152-dd4e-411a-9df5-d251ebaa4d63"
  }
}

resource "google_compute_instance_template" "pass" {
  name         = "test"
  machine_type = "n1-standard-1"
  disk {}
  labels = {
    yor_trace = "f1b7951f-32e1-4b66-a679-26604a649bd2"
  }
}

resource "google_compute_instance_from_template" "unknown" {
  name                     = "test"
  source_instance_template = google_compute_instance_template.pass.id
  labels = {
    yor_trace = "8bcc48c5-51f2-4385-ad85-8731722aad03"
  }
}

