
resource "aws_s3_bucket_object" "pass" {
  bucket       = aws_s3_bucket.object_bucket.bucket
  key          = "tf-testing-obj-%[1]d-encrypted"
  content      = "Keep Calm and Carry On"
  content_type = "text/plain"
  kms_key_id   = aws_kms_key.example.arn
  tags = {
    yor_trace = "1def62c2-bf78-4fa5-b585-c5ea039ab825"
  }
}


resource "aws_s3_bucket_object" "fail" {
  bucket       = aws_s3_bucket.object_bucket.bucket
  key          = "tf-testing-obj-%[1]d-encrypted"
  content      = "Keep Calm and Carry On"
  content_type = "text/plain"
  tags = {
    yor_trace = "a54d0f48-5307-4ec2-bb90-b6d8e0631f1b"
  }
}