
//global
resource "aws_waf_web_acl" "fail" {
  name        = "tfWebACL"
  metric_name = "tfWebACL"

  default_action {
    type = "ALLOW"
  }
  tags = {
    yor_trace = "6d161a4e-c806-48d7-b4b5-9b5b506f6da9"
  }
}

provider "aws" {
  region = "us-east-1"
}

//global
resource "aws_waf_web_acl" "pass" {
  name        = "tfWebACLpass"
  metric_name = "tfWebACLpass"

  default_action {
    type = "ALLOW"
  }

  rules {
    priority = 1
    rule_id  = "30231cc1-ae2d-44e9-8212-dfb6185288a8"
    type     = "REGULAR"

    action {
      type = "BLOCK"
    }
  }

  logging_configuration {
    log_destination = aws_kinesis_firehose_delivery_stream.example.arn

    redacted_fields {
      field_to_match {
        type = "URI"
      }

      field_to_match {
        data = "referer"
        type = "HEADER"
      }
    }
  }
  tags = {
    yor_trace = "13b24318-72bd-4318-9e02-f043c3d67dc0"
  }
}

resource "aws_wafregional_web_acl" "pass" {
  name        = "tfWebACLregional"
  metric_name = "tfWebACLregional"

  default_action {
    type = "ALLOW"
  }

  rule {
    action {
      type = "BLOCK"
    }

    priority = 1
    rule_id  = aws_wafregional_rule.wafrule.id
    type     = "REGULAR"
  }

  logging_configuration {
    log_destination = aws_kinesis_firehose_delivery_stream.example.arn

    redacted_fields {
      field_to_match {
        type = "URI"
      }

      field_to_match {
        data = "referer"
        type = "HEADER"
      }
    }
  }
  tags = {
    yor_trace = "cdbb69f7-2e63-4ccd-922d-730fdebea5d2"
  }
}

resource "aws_wafregional_web_acl" "fail" {
  name        = "tfWebACLregionalfail"
  metric_name = "tfWebACLregionalfail"

  default_action {
    type = "ALLOW"
  }

  tags = {
    yor_trace = "5d3ce49d-665b-4949-b0b1-c5f73a03c293"
  }
}