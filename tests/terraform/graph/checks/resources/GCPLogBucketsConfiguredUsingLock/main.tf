resource "google_logging_organization_sink" "org_sink_good_1" {
  name        = "my-sink"
  description = "some explaination on what this is"
  org_id      = "123456789"
  destination = google_storage_bucket.log_bucket_good.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_logging_folder_sink" "folder_sink_good_1" {
  name        = "my-sink"
  description = "some explaination on what this is"
  folder      = "folder-name"
  destination = google_storage_bucket.log_bucket_good.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_logging_folder_sink" "folder_sink_bad_1" {
  name        = "my-sink"
  description = "some explaination on what this is"
  folder      = "folder-name"
  destination = google_storage_bucket.log_bucket_bad_1.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_logging_folder_sink" "folder_sink_bad_2" {
  name        = "my-sink"
  description = "some explaination on what this is"
  folder      = "folder-name"
  destination = google_storage_bucket.log_bucket_bad_2.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_logging_project_sink" "project_sink_good_1" {
  name                   = "my-pubsub-instance-sink"
  destination            = google_storage_bucket.log_bucket_good.name
  filter                 = "resource.type = gce_instance AND severity >= WARNING"
  unique_writer_identity = true
}

resource "google_logging_project_sink" "project_sink_bad_1" {
  name                   = "my-pubsub-instance-sink"
  destination            = google_storage_bucket.log_bucket_bad_1.name
  filter                 = "resource.type = gce_instance AND severity >= WARNING"
  unique_writer_identity = true
}

resource "google_logging_project_sink" "project_sink_bad_2" {
  name                   = "my-pubsub-instance-sink"
  destination            = google_storage_bucket.log_bucket_bad_2.name
  filter                 = "resource.type = gce_instance AND severity >= WARNING"
  unique_writer_identity = true
}


resource "google_logging_organization_sink" "org_sink_bad_1" {
  name        = "my-sink"
  description = "some explaination on what this is"
  org_id      = "123456789"

  destination = google_storage_bucket.log_bucket_bad_1.name
}

resource "google_logging_organization_sink" "org_sink_bad_2" {
  name        = "my-sink"
  description = "some explaination on what this is"
  org_id      = "123456789"

  destination = google_storage_bucket.log_bucket_bad_2.name
}

resource "google_storage_bucket" "log_bucket_good" {
  name = "organization-logging-bucket"

  retention_policy {
    retention_period = 1000
    is_locked        = true
  }
  labels = {
    yor_trace = "3bd08e76-3d36-4c90-8c40-77f9d4b2a0e7"
  }
}


resource "google_storage_bucket" "log_bucket_bad_1" {
  name = "organization-logging-bucket"

  retention_policy {
    retention_period = 1000
    is_locked        = false
  }
  labels = {
    yor_trace = "5e946521-637c-4aad-a5d3-559a282f8e99"
  }
}

resource "google_storage_bucket" "log_bucket_bad_2" {
  name = "organization-logging-bucket"

  retention_policy {
    retention_period = 1000
  }
  labels = {
    yor_trace = "2c01b7bf-d902-4e0a-98b7-4b2a0311554a"
  }
}
