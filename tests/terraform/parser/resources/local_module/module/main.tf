resource "aws_s3_bucket" "mod_bucket" {
  bucket = "example"

  versioning {
    enabled = var.versioning
  }
  tags = {
    yor_trace = "e3d2f47b-c81b-4516-b091-0102fd8023ae"
  }
}

variable "versioning" {
  type = bool
}
