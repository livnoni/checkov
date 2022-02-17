resource "aws_s3_bucket" "mybucket" {
  bucket = "MyBucket"
  tags = {
    yor_trace = "8f804df5-b6a3-4a2b-a91c-cc6a03737ec2"
  }
}