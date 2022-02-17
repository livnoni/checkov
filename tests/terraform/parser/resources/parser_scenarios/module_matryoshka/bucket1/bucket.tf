module "bucket2" {
  source = "./bucket2"
}

resource "aws_s3_bucket" "example1" {
  bucket = "bucket1"
  tags = {
    yor_trace = "c4ee1ab0-97dc-475e-b828-f4717b90ce88"
  }
}