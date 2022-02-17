# pass

resource "aws_lb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  drop_invalid_header_fields = true
  tags = {
    yor_trace = "37d9054f-ce4d-4833-a7a8-224468f7ad5b"
  }
}

resource "aws_alb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  drop_invalid_header_fields = true
  tags = {
    yor_trace = "324e373b-6752-4c58-86d7-f108014e1fe0"
  }
}

# failure

resource "aws_lb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "cdc8d709-b452-48ac-bfe0-483387521fae"
  }
}

resource "aws_alb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "f9d333a7-fc87-4db2-bbc6-d1405ef92838"
  }
}

resource "aws_lb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  drop_invalid_header_fields = false
  tags = {
    yor_trace = "532d4f71-898e-4c30-91f2-6dacc8c7f011"
  }
}

resource "aws_alb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  drop_invalid_header_fields = false
  tags = {
    yor_trace = "aa27d7df-37db-4520-b973-6b1327026398"
  }
}

# unknown

resource "aws_lb" "network" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "5a2a13c1-6304-494e-8c39-0153dccae280"
  }
}

resource "aws_lb" "gateway" {
  load_balancer_type = "gateway"
  name               = "glb"

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "0575de91-7539-46d8-97ed-f30de8a8e91c"
  }
}
