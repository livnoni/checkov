resource "aws_instance" "defaults" {
  metadata_options {
  }
  tags = {
    yor_trace = "c9ff5daf-4916-448f-bdc3-6cd815f30af9"
  }
}

resource "aws_instance" "optional_token" {
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
  }
  tags = {
    yor_trace = "88977819-089e-4098-8719-e3e420ae91b1"
  }
}

resource "aws_instance" "disabled" {
  metadata_options {
    http_endpoint = "disabled"
  }
  tags = {
    yor_trace = "dc6b74ed-314d-4186-ae03-b987179183c8"
  }
}

resource "aws_instance" "required" {
  metadata_options {
    http_tokens = "required"
  }
  tags = {
    yor_trace = "dc93ef64-2c83-423b-ab20-f4f10ea35d4c"
  }
}

resource "aws_launch_configuration" "required_lc" {
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
  image_id      = ""
  instance_type = ""
}

resource "aws_launch_configuration" "optional_lc" {
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }
  image_id      = ""
  instance_type = ""
}

resource "aws_launch_template" "optional_lt" {
  metadata_options {
    http_tokens = "optional"
  }
  tags = {
    yor_trace = "19015ec6-8609-43de-9955-d03cfae347b0"
  }
}

resource "aws_launch_template" "default_lt" {
  metadata_options {
    http_endpoint = "enabled"
  }
  tags = {
    yor_trace = "fda47b61-7483-41b6-bb89-760f34a103da"
  }
}