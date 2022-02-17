module "bucket3" {
  source = "./bucket3"
}

resource "aws_s3_bucket" "example2" {
  bucket = "bucket2"
  tags = {
    yor_trace = "d6ea6937-19e3-4f04-9d0b-75f5dfe3fa7a"
  }
}