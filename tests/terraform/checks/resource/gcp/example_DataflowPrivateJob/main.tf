
# Passes due to ip_configuration" existing and set to private
resource "google_dataflow_job" "pass" {
  name              = "my-pass-job"
  template_gcs_path = "gs://my-bucket/templates/template_file"
  temp_gcs_location = "gs://my-bucket/tmp_dir"
  parameters = {
    foo = "bar"
    baz = "qux"
  }

  ip_configuration = "WORKER_IP_PRIVATE"
  labels = {
    yor_trace = "68c49544-b1de-4951-bdcd-5257cd677fd0"
  }
}


# Fails due to "ip_configuration" not existing
# Dataflow jobs are public by default
resource "google_dataflow_job" "fail1" {
  name              = "my-fail-job1"
  template_gcs_path = "gs://my-bucket/templates/template_file"
  temp_gcs_location = "gs://my-bucket/tmp_dir"
  parameters = {
    foo = "bar"
    baz = "qux"
  }

  labels = {
    yor_trace = "6ab924c8-1e4c-49ad-9fb5-c7df90d61017"
  }
}

# Fails due to "ip_configuration" existing but set to public
resource "google_dataflow_job" "fail2" {
  name              = "my-fail-job2"
  template_gcs_path = "gs://my-bucket/templates/template_file"
  temp_gcs_location = "gs://my-bucket/tmp_dir"
  parameters = {
    foo = "bar"
    baz = "qux"
  }

  ip_configuration = "WORKER_IP_PUBLIC"
  labels = {
    yor_trace = "6132ffff-8c4f-4907-8daa-0ddf315504ed"
  }
}
