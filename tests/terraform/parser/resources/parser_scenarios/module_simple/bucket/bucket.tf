resource "aws_s3_bucket" "mybucket" {
  bucket = "MyBucket"
  tags = {
    yor_trace = "915815c7-6b5c-4af4-bda9-79ce1fcc32c9"
  }
}