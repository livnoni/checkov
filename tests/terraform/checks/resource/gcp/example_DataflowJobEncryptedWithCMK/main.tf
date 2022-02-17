resource "google_dataflow_job" "fail" {
  name              = "dataflow-job"
  template_gcs_path = "gs://my-bucket/templates/template_file"
  temp_gcs_location = "gs://my-bucket/tmp_dir"
  parameters = {
    foo = "bar"
    baz = "qux"
  }
  #   kms_key_name =
  labels = {
    yor_trace = "b3d18b93-c58b-4689-9d00-606cd740e6ba"
  }
}

resource "google_dataflow_job" "pass" {
  name              = "dataflow-job"
  template_gcs_path = "gs://my-bucket/templates/template_file"
  temp_gcs_location = "gs://my-bucket/tmp_dir"
  parameters = {
    foo = "bar"
    baz = "qux"
  }
  kms_key_name = "SecretSquirrel"
  labels = {
    yor_trace = "f992dbb6-9c3c-4fdc-b827-6047e21b9972"
  }
}
