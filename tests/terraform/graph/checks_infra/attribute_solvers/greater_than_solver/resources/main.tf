resource "aws_s3_bucket" "b1" {
  bucket = "abc"
  tags = {
    yor_trace = "d63f2778-2de7-4724-a8b0-8e056ef6a729"
  }
}

resource "aws_s3_bucket" "b2" {
  bucket = "xyz"
  tags = {
    yor_trace = "1a7e3eb7-9fae-44cc-b53a-3ec58d71e3eb"
  }
}

resource "aws_s3_bucket" "b3" {
  bucket = "ccc"
  tags = {
    yor_trace = "eb4f076c-216d-4db4-b61d-13ed470d6384"
  }
}