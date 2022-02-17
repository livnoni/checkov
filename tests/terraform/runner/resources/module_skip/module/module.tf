#
# WARNING: Line numbers mater in this test!
#          Update test_module_skip if a change is made!
#

# Bucket that will fail (no encryption) defined INSIDE a module
resource "aws_s3_bucket" "inside" {
  bucket = "inside-bucket"
  tags = {
    yor_trace = "cab8f5d0-92c1-49b0-88e4-ebc97cc5b661"
  }
}

resource "aws_s3_bucket" "inside2" {
  bucket = "inside-bucket-2"
  tags = {
    yor_trace = "0e4a9848-40b7-4967-8b29-afd2ac469035"
  }
}

module "another_module" {
  source = "../another/module"
}
