resource "aws_s3_bucket" "test" {
  bucket = var.BUCKET_NAME
  tags = {
    yor_trace = "482cb9d4-5256-4e83-8097-afe92a443afd"
  }
}
