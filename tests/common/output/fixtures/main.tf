resource "aws_s3_bucket" "destination" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = var.acl
  versioning {
    enabled = var.is_enabled
  }
  tags = {
    yor_trace = "36130bc1-cdfb-4c96-b7df-40b02dff4508"
  }
}