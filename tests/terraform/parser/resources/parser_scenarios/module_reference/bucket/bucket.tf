output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

resource "aws_s3_bucket" "example" {
  bucket = "my_bucket"
  tags = {
    yor_trace = "e6d2ded4-b12a-43ec-829e-86772491cd0e"
  }
}