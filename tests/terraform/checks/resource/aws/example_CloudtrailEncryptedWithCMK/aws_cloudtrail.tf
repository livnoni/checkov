resource "aws_cloudtrail" "fail" {
  name                          = "TRAIL"
  s3_bucket_name                = aws_s3_bucket.test.id
  include_global_service_events = true
  tags = {
    yor_trace = "3ec499dd-7b8d-4313-b32e-c4f6e59a363b"
  }
}

resource "aws_cloudtrail" "pass" {
  name                          = "TRAIL"
  s3_bucket_name                = aws_s3_bucket.test.id
  include_global_service_events = true
  kms_key_id                    = aws_kms_key.test.arn
  tags = {
    yor_trace = "924d6c6b-9daa-4165-a45b-4b1be144fb9b"
  }
}