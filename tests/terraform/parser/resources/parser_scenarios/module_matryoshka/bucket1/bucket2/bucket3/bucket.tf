resource "aws_s3_bucket" "example3" {
  bucket = "bucket3"
  acl    = "public-read" # used by test_runner.py
  tags = {
    yor_trace = "e6eab63f-b9e9-4274-88c2-ece201d5ca5b"
  }
}