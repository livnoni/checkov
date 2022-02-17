resource "aws_ebs_volume" "pass" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 1
  encrypted         = true
  kms_key_id        = aws_kms_key.test.arn

  tags = {
    Name      = "taggy"
    yor_trace = "adfc592c-bd60-46d6-b5cd-b3712e138f44"
  }
}

resource "aws_ebs_volume" "fail" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 1
  encrypted         = true

  tags = {
    Name      = "taggy"
    yor_trace = "b4bbe2a7-e075-4f4d-97db-27a31335c08a"
  }
}