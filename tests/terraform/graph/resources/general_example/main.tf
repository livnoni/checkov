provider "aws" {
  profile = var.aws_profile
  region  = "us-east-1"
  alias   = "east1"
}

locals {
  bucket_name = var.bucket_name
}

resource "aws_s3_bucket" "template_bucket" {
  provider      = aws.east1
  region        = var.region
  bucket        = local.bucket_name
  acl           = "acl"
  force_destroy = true
  tags = {
    yor_trace = "d3aac361-4586-4161-8d60-341ef3d2ec5f"
  }
}