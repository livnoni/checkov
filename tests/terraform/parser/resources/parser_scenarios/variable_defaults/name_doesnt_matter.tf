variable "BUCKET_NAME" {
  type    = string
  default = "this-is-my-default"
}

resource "aws_s3_bucket" "test" {
  bucket = var.BUCKET_NAME
  tags = {
    yor_trace = "3c0a0a29-5619-45ce-a6be-b195058a6670"
  }
}
