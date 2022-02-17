# Bucket that will fail (no encryption) defined INSIDE a module
resource "aws_s3_bucket" "nested-inside" {
  bucket = "nested-inside-bucket"
  tags = {
    yor_trace = "a3742649-9483-49f3-9ba5-713ed3c233b6"
  }
}
