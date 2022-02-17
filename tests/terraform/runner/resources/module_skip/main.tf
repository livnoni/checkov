#
# WARNING: Line numbers mater in this test!
#          Update test_module_skip if a change is made!
#

module "test_module" {
  source = "./module"

  #checkov:skip=CKV_AWS_19:Skip encryption
}

resource "aws_s3_bucket" "outside" {
  bucket = "outside-bucket"

  #checkov:skip=CKV_AWS_19:Skip encryption
  tags = {
    yor_trace = "f99e8a3f-9455-4c52-97ca-feded2b1e3d4"
  }
}
