resource "aws_lb" "lb_good_1" {
  internal = false
  tags = {
    yor_trace = "f47a0c46-b528-485d-a94c-f2c974521caa"
  }
}

resource "aws_lb" "lb_good_2" {
  internal = false
  tags = {
    yor_trace = "51cdebc6-bcee-40b4-b458-d157b8f8752c"
  }
}

resource "aws_alb" "alb_good_1" {
  internal = false
  tags = {
    yor_trace = "83a9cb48-58a1-40a1-a3ed-ab1e5198395c"
  }
}

resource "aws_wafregional_web_acl_association" "foo" {
  resource_arn = aws_lb.lb_good_1.arn
  web_acl_id   = aws_wafregional_web_acl.foo.id
}

resource "aws_wafv2_web_acl_association" "bar" {
  resource_arn = aws_lb.lb_good_2.arn
  web_acl_arn  = aws_wafv2_web_acl.bar.arn
}

resource "aws_wafv2_web_acl_association" "zed" {
  resource_arn = aws_alb.alb_good_1.arn
  web_acl_arn  = aws_wafv2_web_acl.zed.arn
}

//public no WAF
resource "aws_lb" "lb_bad_1" {
  internal = false
  tags = {
    yor_trace = "4c1913d1-fc56-4408-a001-e3eecc1fbad5"
  }
}

//internal should ignore
resource "aws_lb" "ignore" {
  internal = true
  tags = {
    yor_trace = "16527474-a08a-4e2f-b527-87fbace49a2d"
  }
}

//public internal not set (takes default - public)
resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "16bf6bd8-806f-43d4-b3c0-7011bd54e3a4"
  }
}

//public no WAF
resource "aws_alb" "alb_bad_1" {
  internal = false
  tags = {
    yor_trace = "db588176-0c83-468d-9634-f0df408c6451"
  }
}

// NLB or Gateway LB can't have a WAF associated

resource "aws_lb" "network" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "13af2f45-4eb5-45c1-97e6-aab5e236534f"
  }
}

resource "aws_lb" "gateway" {
  load_balancer_type = "gateway"
  name               = "glb"

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "87106377-54dd-4f77-8a18-aaab418437e8"
  }
}
