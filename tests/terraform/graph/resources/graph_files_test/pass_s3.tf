resource "aws_s3_bucket" "bucket_with_versioning" {
  versioning {
    enabled = var.versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.encryption
      }
    }
  }
  tags = {
    yor_trace = "23ce68b4-72f7-4c8a-8d44-29a11e64f019"
  }
}