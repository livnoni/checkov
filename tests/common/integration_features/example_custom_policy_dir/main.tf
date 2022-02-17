
resource "aws_s3_bucket" "b1" {
  bucket = "bucket1"
  tags = {
    yor_trace = "39899f50-d124-4e08-99ac-a44b752643f7"
  }
}
