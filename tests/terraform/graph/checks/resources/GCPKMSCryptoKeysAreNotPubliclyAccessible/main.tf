resource "google_kms_key_ring" "keyring" {
  name     = "keyring-example"
  location = "global"
}


resource "google_kms_crypto_key" "key_good_1" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "09bb7baa-8936-475f-ac08-f6da187b31d2"
  }
}

resource "google_kms_crypto_key" "key_bad_1" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "f6f42a01-5bb6-40df-bacb-a0e7926ae9ae"
  }
}

resource "google_kms_crypto_key" "key_bad_2" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "4a37e281-f862-47e6-bd8e-56146b8d359f"
  }
}

resource "google_kms_crypto_key_iam_member" "crypto_key_good" {
  crypto_key_id = google_kms_crypto_key.key_good_1.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "user:jane@example.com"
}

resource "google_kms_crypto_key_iam_member" "crypto_key_bad_1" {
  crypto_key_id = google_kms_crypto_key.key_bad_1.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "allUsers"
}

resource "google_kms_crypto_key_iam_member" "crypto_key_bad_2" {
  crypto_key_id = google_kms_crypto_key.key_bad_2.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "allAuthenticatedUsers"
}

resource "google_kms_crypto_key" "key_bad_2" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "4a37e281-f862-47e6-bd8e-56146b8d359f"
  }
}

resource "google_kms_crypto_key" "key_good_2" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "f09e38fb-4886-4b3b-9875-da7f4f7bb5f3"
  }
}

resource "google_kms_crypto_key" "key_bad_3" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "38c978cd-ffac-4a57-a6ad-9aeae04fe900"
  }
}

resource "google_kms_crypto_key" "key_bad_4" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "4c3fdb2f-9569-4b61-8e26-080c7fe18e2c"
  }
}


resource "google_kms_crypto_key_iam_binding" "crypto_key" {
  crypto_key_id = google_kms_crypto_key.key_good_2.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"

  members = [
    "user:jane@example.com",
  ]
}

resource "google_kms_crypto_key_iam_binding" "crypto_key" {
  crypto_key_id = google_kms_crypto_key.key_bad_3.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"

  members = [
    "allUsers",
  ]
}

resource "google_kms_crypto_key_iam_binding" "crypto_key" {
  crypto_key_id = google_kms_crypto_key.key_bad_4.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"

  members = [
    "allAuthenticatedUsers",
  ]
}
