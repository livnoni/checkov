resource "aws_s3_bucket" "this" {
  count = 1

  bucket = var.bucket
  acl    = ""
  tags = {
    yor_trace = "e7e8dafb-d445-4a35-bbfa-d51519ef9acc"
  }
  force_destroy = false
}

resource "aws_s3_bucket_policy" "this" {
  count = var.create_bucket && (var.attach_elb_log_delivery_policy || var.attach_policy) ? 1 : 0

  bucket = aws_s3_bucket.this[0].id
  policy = var.attach_elb_log_delivery_policy ? {} : var.policy
}
