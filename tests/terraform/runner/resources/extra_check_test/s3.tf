resource "aws_s3_bucket" "a" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Production"
    yor_trace   = "83fa5966-de21-4099-9eee-d8a4e444d8a0"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    yor_trace   = "32634e49-a03e-4f12-9135-4214da79cf77"
  }
}


resource "aws_s3_bucket" "c" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
  tags = {
    yor_trace = "6bd4f52b-78c8-4c49-9eb7-9b1914d6368a"
  }
}


