resource "google_dataproc_cluster" "fail" {
  name   = "simplecluster"
  region = "us-central1"
  cluster_config {
    # encryption_config{
    #   kms_key_name="SecretSquirrel"
    # }
  }
  labels = {
    yor_trace = "e8569b28-219f-4160-aaef-88b3e843fb5d"
  }
}

resource "google_dataproc_cluster" "pass" {
  name   = "simplecluster"
  region = "us-central1"
  cluster_config {
    encryption_config {
      kms_key_name = "SecretSquirrel"
    }
  }
  labels = {
    yor_trace = "3574d521-8887-43ad-9747-a50c0882df2f"
  }
}