resource "aws_s3_bucket" "destination" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = var.acl
  versioning {
    enabled = var.is_enabled
  }
  tags = {
    yor_trace = "57d85a95-2db3-492b-b4a1-b5a8ee58d655"
  }
}