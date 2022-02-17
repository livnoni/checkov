variable "tags" {}


resource "aws_s3_bucket" "bucket" {
  bucket = "its.a.bucket"
  # NOTE: Prior to find_var_blocks handling vars in parameters, this didn't work
  tags = merge(var.tags, { "more_tags" = "yes" }, {
    yor_trace = "185f3838-0d88-4f5b-a5fe-8af9ebbdc43e"
  })
}