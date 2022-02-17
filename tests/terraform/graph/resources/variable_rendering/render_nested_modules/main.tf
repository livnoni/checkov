provider "aws" {
  profile = var.aws_profile
  region  = "us-east-1"
  alias   = "east1"
}

locals {
  dummy_with_dash = format("-%s", var.dummy_1)
  bucket_name     = var.bucket_name
  x = {
    y = "z"
  }
}
resource "aws_instance" "example" {
  ami           = local.ami_name
  instance_type = module.child.myoutput
  tags = {
    yor_trace = "13d225ae-9a4b-4c02-9ea3-8fd259bd2448"
  }
}

resource "aws_s3_bucket" "template_bucket" {
  provider      = aws.east1
  region        = var.region
  bucket        = local.bucket_name
  acl           = var.acl
  force_destroy = true
  tags = {
    yor_trace = "528903c7-2111-4f3a-8241-105df8df450f"
  }
}

resource "aws_eip" "ip" {
  vpc      = local.is_vpc
  instance = aws_instance.example.id
  tags = {
    yor_trace = "b9bb278e-2de4-4873-ae63-dee2a714908c"
  }
}

locals {
  is_vpc   = true
  ami_name = local.dummy_with_dash
}

module "child" {
  source = "./child"
}