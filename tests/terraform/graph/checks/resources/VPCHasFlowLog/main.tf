resource "aws_flow_log" "example" {
  iam_role_arn    = "arn"
  log_destination = "log"
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.ok_vpc.id
  tags = {
    yor_trace = "d44df616-a7e2-475b-bac6-4f7a8181d13d"
  }
}

resource "aws_vpc" "not_ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "64a44c58-0078-4ad1-abe6-21d51ce8c371"
  }
}

resource "aws_vpc" "ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "0c8d2356-a8bd-4372-8178-071e5e3b99df"
  }
}