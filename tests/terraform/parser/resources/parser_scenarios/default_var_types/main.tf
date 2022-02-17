variable "map_with_default" {
  type    = map(string)
  default = { x = "123" }
}

variable "map_without_default" {
  type = map(string)
}

variable "map_with_default_no_type" {
  type    = map
  default = { x = "123" }
}

variable "map_without_default_no_type" {
  type = map
}

variable "list_with_default" {
  type    = list(string)
  default = ["123"]
}

variable "list_without_default" {
  type = list(string)
}


resource "google_compute_instance" "a" {
  metadata = merge(var.map_with_default, { block-project-ssh-keys = true })
  labels = {
    yor_trace = "d28181e2-8ad2-4826-aeb4-f216648f70fa"
  }
}

resource "google_compute_instance" "b" {
  metadata = merge(var.map_without_default, { block-project-ssh-keys = true })
  labels = {
    yor_trace = "2c048c8a-c4ca-4758-9267-6eb090e2d043"
  }
}

resource "google_compute_instance" "c" {
  metadata = merge(var.map_with_default_no_type, { block-project-ssh-keys = true })
  labels = {
    yor_trace = "4c7ff8b0-7cc1-46a7-97bf-2b85e0581c2a"
  }
}

resource "google_compute_instance" "d" {
  metadata = merge(var.map_without_default_no_type, { block-project-ssh-keys = true })
  labels = {
    yor_trace = "2e564156-15e5-4218-8fb5-226da9244dc7"
  }
}

resource "google_compute_instance" "e" {
  metadata = concat(var.list_with_default, ["xyz"])
  labels = {
    yor_trace = "1c17c1e8-8304-4722-97e2-29670d56a4ee"
  }
}

resource "google_compute_instance" "f" {
  metadata = concat(var.list_without_default, ["xyz"])
  labels = {
    yor_trace = "c3d5671b-41c9-479e-b926-0872d83a0c58"
  }
}
