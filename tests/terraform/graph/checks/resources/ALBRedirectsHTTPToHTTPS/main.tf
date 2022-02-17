resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "ef8e9159-96ed-4b70-9914-ed68302f0468"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "3a1cb3e2-fc9a-4160-b397-a724275ae17c"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "66926e4b-ddcb-44db-a93a-e6b800e4bbab"
  }
}

resource "aws_alb" "alb_good_1" {
  tags = {
    yor_trace = "0a58f1f1-a04e-4a15-8e8a-23023c56990c"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "7e712a78-dd8c-4305-add6-4f6712e27c18"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "1dfc4ccc-80dc-4fb0-891d-b639a051d1ce"
  }
}

resource "aws_alb" "alb_bad_1" {
  tags = {
    yor_trace = "1074aa73-766d-4b59-a41d-c227f71508a1"
  }
}

resource "aws_lb_listener" "listener_good_1" {
  load_balancer_arn = aws_lb.lb_good_1.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "action"
  }
}

resource "aws_lb_listener" "listener_good_2" {
  load_balancer_arn = aws_lb.lb_good_2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_lb_listener" "listener_good_3" {
  load_balancer_arn = aws_lb.lb_good_3.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_alb_listener" "listener_good_1" {
  load_balancer_arn = aws_alb.alb_good_1.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
  tags = {
    yor_trace = "fb2e3f64-4db8-447c-870b-66dc2782f787"
  }
}

resource "aws_lb_listener" "listener_bad_1" {
  load_balancer_arn = aws_lb.lb_bad_1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_lb_listener" "listener_bad_2" {
  load_balancer_arn = aws_lb.lb_bad_2.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_alb_listener" "listener_bad_1" {
  load_balancer_arn = aws_alb.alb_bad_1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
  tags = {
    yor_trace = "801d2e14-26cc-4808-b59f-f16bc85e4259"
  }
}