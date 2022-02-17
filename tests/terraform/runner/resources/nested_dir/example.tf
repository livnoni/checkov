resource "aws_s3_bucket" "foo-bucket" {
  region        = var.region
  bucket        = local.bucket_name
  force_destroy = true

  tags = {
    Name      = "foo-${data.aws_caller_identity.current.account_id}"
    yor_trace = "bf4d91d5-bea3-406d-aa20-02ca5cc86fcd"
  }
}
data "aws_caller_identity" "current" {}
