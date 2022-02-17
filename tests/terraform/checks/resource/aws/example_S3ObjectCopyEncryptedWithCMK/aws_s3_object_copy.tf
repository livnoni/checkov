resource "aws_s3_object_copy" "pass" {
  bucket             = aws_s3_bucket.target.bucket
  bucket_key_enabled = true
  key                = "test"
  kms_key_id         = aws_kms_key.test.arn
  source             = "${aws_s3_bucket.source.bucket}/${aws_s3_bucket_object.source.key}"
  tags = {
    yor_trace = "35a8807b-5b72-48c4-b3d9-07bb27f565c0"
  }
}

resource "aws_s3_object_copy" "fail" {
  bucket             = aws_s3_bucket.target.bucket
  bucket_key_enabled = true
  key                = "test"
  source             = "${aws_s3_bucket.source.bucket}/${aws_s3_bucket_object.source.key}"
  tags = {
    yor_trace = "209af61d-ab18-4504-b903-3a8a3fa8dcdd"
  }
}