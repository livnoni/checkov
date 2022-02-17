
//global
resource "aws_waf_web_acl" "fail" {
  name        = "tfWebACL"
  metric_name = "tfWebACL"

  default_action {
    type = "ALLOW"
  }
  tags = {
    yor_trace = "42f9921a-6c1f-4b32-84b1-403b7f4f0c2d"
  }
}

resource "aws_waf_web_acl" "fail2" {
  name        = "tfWebACLfail2"
  metric_name = "tfWebACLfail2"

  default_action {
    type = "ALLOW"
  }
  rules {

  }
  tags = {
    yor_trace = "b8e76f9d-eb09-48f9-8dae-c60f1d6fda38"
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
  tags = {
    yor_trace = "d5a81f74-e66b-472e-aabc-1564c2bcbccb"
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
  tags = {
    yor_trace = "83fe5254-71f4-4cfc-b9a4-0553ea34b31d"
  }
}

resource "aws_wafregional_web_acl" "fail" {
  name        = "tfWebACLregionalfail"
  metric_name = "tfWebACLregionalfail"

  default_action {
    type = "ALLOW"
  }

  tags = {
    yor_trace = "25191d14-a417-4793-9688-6a5be664f240"
  }
}

resource "aws_wafregional_web_acl" "fail2" {
  name        = "tfWebACLregionalfail2"
  metric_name = "tfWebACLregionalfail2"

  default_action {
    type = "ALLOW"
  }

  rule {
  }
  tags = {
    yor_trace = "252237c7-b709-49f3-9ed2-edc073c28d2a"
  }
}

