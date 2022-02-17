
resource "aws_s3_bucket" "fail4" {
  region        = "us-west-2"
  bucket        = "my_bucket"
  acl           = "public-read"
  force_destroy = true
  tags {
    Name = "my-bucket"
  }
  tags = {
    yor_trace = "36ec2421-77cc-42a3-aea0-259c7d6742e3"
  }
}


resource "aws_s3_bucket" "fail3" {
  region        = "us-west-2"
  bucket        = "my_bucket"
  acl           = "public-read"
  force_destroy = true
  tags = { Name = "my-bucket"
    yor_trace = "9e6ee727-a3fd-4adb-b72e-11cd7312fc27"
  }
  enabled = True
}

resource "aws_s3_bucket" "fail2" {
  region        = "us-west-2"
  bucket        = "my_bucket"
  acl           = "public-read"
  force_destroy = true
  tags = {
    Name = "my-bucket"
    wrong_field = {
    enabled = true }
    yor_trace = "a8b0c48c-efd2-4bcd-b048-d246e6f93301"
  }
}

resource "aws_s3_bucket" "fail" {
  region        = "us-west-2"
  bucket        = "my_bucket"
  acl           = "public-read"
  force_destroy = true
  tags = { Name = "my-bucket"
    yor_trace = "721fa90f-4829-432c-9ccc-6c691adca87c"
  }
  wrong_field = { versioning = { enabled = true } }
}


resource "aws_s3_bucket" "pass" {
  region        = "us-west-2"
  bucket        = "my_bucket"
  acl           = "public-read"
  force_destroy = true

  tags = { Name = "my-bucket"
    yor_trace = "8c04cbc9-b10f-49b7-95b0-a064a92ce22d"
  }

  logging {
    target_bucket = "logging-bucket"
    target_prefix = "log/"
  }
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "failcomplex" {
  acl    = "public-read-write"
  bucket = "superfail"

  versioning {
    enabled    = false
    mfa_delete = false
  }

  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddCannedAcl",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:PutObject","s3:PutObjectAcl"],
      "Resource":"arn:aws:s3:::superfail/*"
    },
    {
        "Principal": {
            "AWS": ["*"],
            "Effect": "Deny",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "*"
            ]
        }
    }
  ]
}
POLICY
  tags = {
    yor_trace = "260ac91c-92fc-4edc-8ee7-1ca73411964b"
  }
}


resource "aws_s3_bucket" "this" {
  bucket = var.bucket
  acl    = "private"
  versioning {
    enabled = var.enabled
  }
  tags = {
    yor_trace = "9fbe2ca3-616c-401b-a86e-7933c2a47d10"
  }
}

variable "enabled" {
  default = true
}