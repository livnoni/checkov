
resource "google_notebooks_instance" "pass1" {
  name         = "pass1-instance"
  location     = "us-west1-a"
  machine_type = "e2-medium"
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }

  # This configures a private Vertex AI instance
  no_public_ip = true
  labels = {
    yor_trace = "261b8765-91b4-4df2-9655-ec98d0a345f0"
  }
}


resource "google_notebooks_instance" "fail1" {
  name         = "fail1-instance"
  location     = "us-west1-a"
  machine_type = "e2-medium"
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }

  # This configures a public Vertex AI instance
  no_public_ip = false
  labels = {
    yor_trace = "0be44fa1-2d61-4575-8489-806528fbe0f6"
  }
}

# This configures a public Vertex AI instance
# b/c there is no "no_public_ip" setting configured
resource "google_notebooks_instance" "fail2" {
  name         = "fail2-instance"
  location     = "us-west1-a"
  machine_type = "e2-medium"
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }
  labels = {
    yor_trace = "d438508b-3cbb-4aaf-a95e-716215968987"
  }
}
