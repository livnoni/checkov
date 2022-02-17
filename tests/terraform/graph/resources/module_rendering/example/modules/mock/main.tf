resource "aws_s3_bucket" "some-bucket" {
  bucket = "my-bucket"
  tags = {
    yor_trace = "7330c939-13c2-4921-9b2e-9d5cfbc737b7"
  }
}

output "o1" {
  value = aws_s3_bucket.some-bucket.arn
}