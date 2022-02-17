resource "aws_s3_bucket" "inner_s3" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = ""
  versioning {
    enabled = var.versioning
  }
  tags = {
    yor_trace = "bea6c9bb-1678-4138-a0dd-fcb933263014"
  }
}