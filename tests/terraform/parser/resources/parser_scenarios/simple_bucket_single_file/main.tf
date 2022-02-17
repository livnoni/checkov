resource "aws_s3_bucket" "test" {
  bucket = "my-test-bucket"
  tags = {
    yor_trace = "044e0be9-60cf-4fe9-bfcd-9939e2fb6a32"
  }
}
