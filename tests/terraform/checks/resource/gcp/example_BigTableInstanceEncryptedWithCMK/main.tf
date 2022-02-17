resource "google_bigtable_instance" "fail" {
  name = "tf-instance"

  cluster {
    cluster_id   = "tf-instance-cluster"
    num_nodes    = 1
    storage_type = "HDD"
    # kms_key_name = "some value"
  }

  labels = {
    my-label  = "prod-label"
    yor_trace = "1bb5326b-cd6b-4cbc-89a4-836595723fa1"
  }
}

resource "google_bigtable_instance" "pass" {
  name = "tf-instance"

  cluster {
    cluster_id   = "tf-instance-cluster"
    num_nodes    = 1
    storage_type = "HDD"
    kms_key_name = google_kms_crypto_key.example.name
  }

  labels = {
    my-label  = "prod-label"
    yor_trace = "a0b04fed-cda6-4edd-87ea-e2daadecf8dd"
  }
}