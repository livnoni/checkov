resource "aws_s3_bucket" "b1" {
  bucket = "bc-test-bucket-1"
  tags = {
    yor_trace = "25cbecf6-a706-4d77-b976-ebb1b7e4a71d"
  }
}