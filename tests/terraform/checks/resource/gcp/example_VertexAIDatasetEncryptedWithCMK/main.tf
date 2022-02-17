resource "google_vertex_ai_dataset" "fail" {
  display_name        = "terraform"
  metadata_schema_uri = "gs://google-cloud-aiplatform/schema/dataset/metadata/image_1.0.0.yaml"
  region              = "us-central1"
  #   encryption_spec {
  #     kms_key_name=
  #   }

  labels = {
    yor_trace = "9cf7af31-aa15-4c3e-b233-ed8c9626b69c"
  }
}

resource "google_vertex_ai_dataset" "pass" {
  display_name        = "terraform"
  metadata_schema_uri = "gs://google-cloud-aiplatform/schema/dataset/metadata/image_1.0.0.yaml"
  region              = "us-central1"
  encryption_spec {
    kms_key_name = google_kms_crypto_key.example.name
  }

  labels = {
    yor_trace = "abe1835b-05d1-45e0-bf46-bdf8a52b98b2"
  }
}
