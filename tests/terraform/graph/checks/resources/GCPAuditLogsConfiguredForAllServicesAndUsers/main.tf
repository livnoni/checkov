resource "google_project" "project_good" {
  name       = "good"
  project_id = "123456"
  labels = {
    yor_trace = "12864bdd-7c0e-4aaf-87da-6a46f1dcb8cc"
  }
}

resource "google_project" "project_bad_1" {
  name       = "bad1"
  project_id = "123456"
  labels = {
    yor_trace = "3a5643bf-30ae-400f-a7df-2515f807d2a9"
  }
}

resource "google_project" "project_bad_2" {
  name       = "bad2"
  project_id = "123456"
  labels = {
    yor_trace = "09a0199a-5430-49b4-8177-40b019675595"
  }
}

resource "google_project" "project_bad_3" {
  name       = "bad3"
  project_id = "123456"
  labels = {
    yor_trace = "3a702a17-c320-47b3-84f2-f5076da96748"
  }
}

resource "google_project_iam_audit_config" "project_good_audit" {
  project = google_project.project_good.id
  service = "allServices"
  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
  }
}

resource "google_project_iam_audit_config" "project_bad_audit_1" {
  project = google_project.project_bad_1.id
  service = "allServices"
  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
    exempted_members = [
      "user:joebloggs@hashicorp.com",
    ]
  }
}

resource "google_project_iam_audit_config" "project_bad_audit_2" {
  project = google_project.project_bad_2.id
  service = "someService"
  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
  }
}