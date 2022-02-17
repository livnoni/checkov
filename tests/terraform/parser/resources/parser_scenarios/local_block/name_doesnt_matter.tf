locals {
  BUCKET_NAME = "my-bucket-name"
}

resource "aws_s3_bucket" "test_with_locals" {
  bucket = local.BUCKET_NAME
  tags = {
    yor_trace = "1337272a-91c4-4dd0-b2d6-a576f5d4e444"
  }
}
