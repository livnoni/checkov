locals {
  common_tags = {
    Tag1 = "one"
    Tag2 = "two"
  }
}

variable "ENV" {}

resource "aws_s3_bucket" "bucket" {
  # var.ENV has no default, so need to evaluate the merge without the
  # fully resolved statement.
  tags = merge(local.common_tags, { Name = "my-bucket-${var.ENV}" }, {
    yor_trace = "1f32263e-ccaa-4e20-94dd-2a3d175dbb4d"
  })
}