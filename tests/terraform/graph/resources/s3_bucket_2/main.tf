resource "aws_s3_bucket" "private" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    yor_trace   = "ffb2aaff-0c27-4c12-b188-0016aab35291"
  }
}

resource "aws_s3_bucket" "public" {
  bucket = "my-tf-test-bucket"
  acl    = "public"

  tags = {
    Name        = "My other bucket"
    Environment = "Prod"
    yor_trace   = "3ed58bde-e7d1-4894-b72e-c2cb56fee326"
  }
}

resource "aws_s3_bucket" "non_tag" {
  bucket = "no-tags"
  acl    = "public"
  tags = {
    yor_trace = "27856963-5d09-4687-81ab-586372073af9"
  }
}
