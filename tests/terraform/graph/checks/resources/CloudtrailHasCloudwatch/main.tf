resource "aws_cloudwatch_log_group" "example" {
  name = "Example"
  tags = {
    yor_trace = "aa2ddbe5-1147-4b1e-a91e-12bcbabdcb6e"
  }
}

resource "aws_cloudtrail" "aws_cloudtrail_ok" {
  name                       = "tf-trail-foobar"
  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.example.arn}:*"
  tags = {
    yor_trace = "000c010b-d871-4575-b3de-b5f531aafd01"
  }
}

resource "aws_cloudtrail" "aws_cloudtrail_not_ok" {
  name = "tf-trail-foobar"
  tags = {
    yor_trace = "8f4e64d6-b5be-4303-bf5b-07ed1b1c650a"
  }
}