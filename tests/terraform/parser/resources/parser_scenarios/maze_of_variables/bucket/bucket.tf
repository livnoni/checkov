variable "name" {}

locals {
  MODULE_TAIL = "bucket"
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.name}-${local.MODULE_TAIL}"
  tags = {
    yor_trace = "2fa52e7b-4afb-4074-8428-e10342d93bc2"
  }
}