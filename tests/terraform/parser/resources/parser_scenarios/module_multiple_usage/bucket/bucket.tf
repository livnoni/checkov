variable "name" {}

locals {
  BUCKET_NAME = var.name
}

resource "aws_s3_bucket" "example" {
  bucket = local.BUCKET_NAME
  tags = {
    yor_trace = "201b2756-4d2e-4be0-8e89-f996911464ea"
  }
}