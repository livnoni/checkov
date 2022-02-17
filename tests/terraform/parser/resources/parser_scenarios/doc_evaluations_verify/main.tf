resource "aws_s3_bucket" "my_bucket" {
  region        = var.region
  bucket        = local.bucket_name
  acl           = var.acl
  force_destroy = true
  tags = {
    yor_trace = "0c0778c4-86fc-419c-8153-cb1c6b144467"
  }
}