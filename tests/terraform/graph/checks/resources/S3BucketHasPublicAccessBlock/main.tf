resource "aws_s3_bucket" "bucket_good_1" {
  bucket = "bucket_good"
  tags = {
    yor_trace = "1e627150-bdee-4546-8ced-a4e8e675e9d3"
  }
}

resource "aws_s3_bucket" "bucket_bad_1" {
  bucket = "bucket_bad_1"
  tags = {
    yor_trace = "24756540-90e9-4f68-853e-895c52143e83"
  }
}

resource "aws_s3_bucket" "bucket_bad_2" {
  bucket = "bucket_bad_2"
  tags = {
    yor_trace = "63674703-846a-4df3-931d-2a5018e16c01"
  }
}

resource "aws_s3_bucket" "bucket_bad_3" {
  bucket = "bucket_bad_3"
  tags = {
    yor_trace = "683a73a3-0a21-42b4-b08f-d64dcb48195c"
  }
}

resource "aws_s3_bucket" "bucket_bad_4" {
  bucket = "bucket_bad_4"
  tags = {
    yor_trace = "67627e06-b03a-4385-a9b6-2ff54aa076fd"
  }
}

resource "aws_s3_bucket_public_access_block" "access_good_1" {
  bucket = aws_s3_bucket.bucket_good_1.id

  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_public_access_block" "access_bad_1" {
  bucket = aws_s3_bucket.bucket_bad_1.id
}

resource "aws_s3_bucket_public_access_block" "access_bad_2" {
  bucket = aws_s3_bucket.bucket_bad_2.id

  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_public_access_block" "access_bad_3" {
  bucket = aws_s3_bucket.bucket_bad_3.id

  block_public_acls   = false
  block_public_policy = true
}