module "bucket1" {
  source = "./bucket1"
}

resource "aws_s3_bucket" "example0" {
  bucket = "bucket0"
  tags = {
    yor_trace = "00ec4c27-8f24-402c-ae29-63bf1eff0c6b"
  }
}