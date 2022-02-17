resource "aws_s3_bucket" "foo-bucket" {
  region        = var.region
  bucket        = local.bucket_name
  force_destroy = true

  tags = {
    Name      = "foo-${data.aws_caller_identity.current.account_id}"
    yor_trace = "b687864e-e793-46e8-8443-d2a522b69fdd"
  }
}
data "aws_caller_identity" "current" {}
