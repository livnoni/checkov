# pass

resource "aws_lb" "enabled" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  enable_cross_zone_load_balancing = true
  tags = {
    yor_trace = "88fe7160-ce99-42ac-8085-a88f29a18fe9"
  }
}

resource "aws_alb" "enabled" {
  load_balancer_type = "gateway"
  name               = "glb"

  enable_cross_zone_load_balancing = true

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "ace91efb-b647-4c72-97d9-8607852ee1a2"
  }
}

# failure

resource "aws_lb" "default" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "807bf651-e58f-44fb-b14e-35a399d32579"
  }
}

resource "aws_alb" "default" {
  load_balancer_type = "gateway"
  name               = "glb"

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "25c71fe2-6f72-4607-a0fb-b2f58a0c66bc"
  }
}

resource "aws_lb" "disabled" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  enable_cross_zone_load_balancing = false
  tags = {
    yor_trace = "d40251b1-4e2e-4f73-b1d8-a706032d6e21"
  }
}

resource "aws_alb" "disabled" {
  load_balancer_type = "gateway"
  name               = "glb"

  enable_cross_zone_load_balancing = false

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "e20bf7d4-69a1-4f8f-b027-03d314874806"
  }
}

# unknown

resource "aws_lb" "application" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "408d9254-83de-44cb-836c-2c85a20c6e34"
  }
}

resource "aws_lb" "default_type" {
  internal = false
  name     = "alb"
  subnets  = var.public_subnet_ids
  tags = {
    yor_trace = "93254cab-4507-44ef-a143-fe218ffea4b0"
  }
}
