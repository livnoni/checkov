resource "aws_cloudwatch_log_group" "pass" {
  retention_in_days = 1
  kms_key_id        = "someKey"
  tags = {
    yor_trace = "0c3f8cd2-1c02-4602-8597-d7736c4bec04"
  }
}

resource "aws_cloudwatch_log_group" "fail" {
  retention_in_days = 1
  tags = {
    yor_trace = "f33c469d-96ea-4917-8c11-f559b8fdada5"
  }
}
