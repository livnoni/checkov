resource "google_project" "project_good_1" {
  name       = "My Project"
  project_id = "good"
  org_id     = "1234567"
  labels = {
    yor_trace = "d4c687be-e01b-4626-b095-ce99388502b1"
  }
}

resource "google_project" "project_good_2" {
  name       = "My Project"
  project_id = "good"
  org_id     = "1234567"
  labels = {
    yor_trace = "21717fc3-65b6-48b2-b053-2869c70c936d"
  }
}

resource "google_project" "project_bad_1" {
  name       = "My Project"
  project_id = "bad"
  org_id     = "1234567"
  labels = {
    yor_trace = "5f0addcb-20d0-4754-9257-07d64f1b5282"
  }
}

resource "google_compute_network" "vpc_network_network" {
  name                    = "vpc-legacy"
  auto_create_subnetworks = true
  project                 = google_project.project_bad_1.id
}

resource "google_compute_network" "vpc_network_1" {
  name    = "vpc-legacy"
  project = google_project.project_good_1.id
}

resource "google_compute_network" "vpc_network_2" {
  name                    = "vpc-legacy"
  project                 = google_project.project_good_1.id
  auto_create_subnetworks = false
}