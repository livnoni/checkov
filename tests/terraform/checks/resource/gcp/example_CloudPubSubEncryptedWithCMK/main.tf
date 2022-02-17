resource "google_pubsub_topic" "fail" {
  name = "example-topic"
  # kms_key_name = google_kms_crypto_key.crypto_key.id
  labels = {
    yor_trace = "3a65ae65-8785-4dbb-8154-624ba9465eed"
  }
}

resource "google_pubsub_topic" "pass" {
  name         = "example-topic"
  kms_key_name = google_kms_crypto_key.crypto_key.id
  labels = {
    yor_trace = "07cf68ba-73de-4539-8132-b3db981747d5"
  }
}