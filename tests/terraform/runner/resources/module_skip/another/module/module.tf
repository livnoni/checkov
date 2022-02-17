# Bucket that will fail (no encryption) defined INSIDE a module
resource "aws_s3_bucket" "nested-inside" {
  bucket = "nested-inside-bucket"
  tags = {
    yor_trace = "66862c7c-095a-4c3b-bf73-93e36bfee772"
  }
}

# this module is used to test 3 layers deep
module "module-3" {
  source = "./module-3"
}
