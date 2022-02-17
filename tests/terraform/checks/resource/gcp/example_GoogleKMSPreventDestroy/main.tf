resource "google_kms_crypto_key" "pass" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "15552000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "93a43e29-769b-4eb7-a328-091eef1651b9"
  }
}

resource "google_kms_crypto_key" "fail" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "15552000s"

  lifecycle {
    prevent_destroy = false
  }
  labels = {
    yor_trace = "51733404-426b-483a-9e4d-94e678281f99"
  }
}

resource "google_kms_crypto_key" "fail2" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "15552000s"
  labels = {
    yor_trace = "8b354909-f9f5-4be1-a732-2b1a1e3fccd5"
  }
}