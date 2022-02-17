# pass

resource "aws_lb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = true
  tags = {
    yor_trace = "3f6a23f0-bb9f-467d-98c3-83927c44fad7"
  }
}

resource "aws_alb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = true
  tags = {
    yor_trace = "6885a8cf-5253-442a-9cfb-73ac2384ea3a"
  }
}

# failure

resource "aws_lb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "07c8aa4f-791e-4e8f-9d83-76e8aa298584"
  }
}

resource "aws_alb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "0316ae63-220c-4d4c-b7ff-61f5e0f7fa36"
  }
}

resource "aws_lb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
  tags = {
    yor_trace = "7564dc0c-e92e-4bff-ae96-292122db58a0"
  }
}

resource "aws_alb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
  tags = {
    yor_trace = "fa096eb8-364f-4f7a-b897-53581b234b33"
  }
}
