resource "aws_s3_bucket" "template_bucket" {
  region        = var.region
  bucket        = "test_bucket_name"
  acl           = "acl"
  force_destroy = true
  tags = {
    yor_trace = "80818791-ed28-45c1-b077-80f1549cad8c"
  }
}