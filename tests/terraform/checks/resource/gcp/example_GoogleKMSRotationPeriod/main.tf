# pass

resource "google_kms_crypto_key" "ninety_days" {
  name            = "crypto-key-example"
  key_ring        = "google_kms_key_ring.keyring.id"
  rotation_period = "7776000s"
  labels = {
    yor_trace = "591cd2be-9683-4a0b-9cad-e22a91623ab4"
  }
}

resource "google_kms_crypto_key" "minimum" {
  name            = "crypto-key-example"
  key_ring        = "google_kms_key_ring.keyring.id"
  rotation_period = "86400s"
  labels = {
    yor_trace = "0e7be132-629b-46bb-a479-2dcb624a5292"
  }
}

# fail

resource "google_kms_crypto_key" "half_year" {
  name            = "crypto-key-example"
  key_ring        = "google_kms_key_ring.keyring.id"
  rotation_period = "15552000s"
  labels = {
    yor_trace = "13696822-5e15-495a-ae95-5ea1ca873673"
  }
}

resource "google_kms_crypto_key" "default" {
  name     = "crypto-key-example"
  key_ring = "google_kms_key_ring.keyring.id"
  labels = {
    yor_trace = "3648a71e-fa2e-4efa-a540-4ed92fd32f25"
  }
}
