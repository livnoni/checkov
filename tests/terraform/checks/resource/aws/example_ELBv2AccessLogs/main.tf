# pass

resource "aws_lb" "enabled" {
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket  = var.bucket_name
    enabled = true
  }
  tags = {
    yor_trace = "ec5584cc-ff3a-49dc-a9ad-a1279c68d94d"
  }
}

resource "aws_alb" "enabled" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket  = var.bucket_name
    enabled = true
  }
  tags = {
    yor_trace = "2187ba7c-4d54-41a2-85c4-c6a1ed1d83ef"
  }
}

# failure

resource "aws_lb" "default" {
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "34bb33f4-c16b-40ee-b3c7-f13a44bca22b"
  }
}

resource "aws_alb" "default" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "d69d6e8f-abd5-4c04-a57b-a52dd4e7593e"
  }
}

resource "aws_lb" "only_bucket" {
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket = var.bucket_name
  }
  tags = {
    yor_trace = "0b88f8e9-534e-48a7-91d3-8d5e8f09b2d6"
  }
}

resource "aws_alb" "only_bucket" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket = var.bucket_name
  }
  tags = {
    yor_trace = "da622dca-555b-4681-a024-2abbea09e1e2"
  }
}

resource "aws_lb" "disabled" {
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket  = var.bucket_name
    enabled = false
  }
  tags = {
    yor_trace = "1bd32760-efa3-4b24-b167-a136b92dc632"
  }
}

resource "aws_alb" "disabled" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket  = var.bucket_name
    enabled = false
  }
  tags = {
    yor_trace = "58709681-d191-4eae-a0c7-a1d6b2c3d9e1"
  }
}

# unknown

resource "aws_lb" "gateway" {
  name               = "glb"
  load_balancer_type = "gateway"

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "bf8bdabf-8dc8-4580-84e7-2f731cb1f19a"
  }
}

