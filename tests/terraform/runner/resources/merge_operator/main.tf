locals {
  default_tags = {
    a = var.a
    b = var.b
    c = var.c
    d = local.d
  }
}

resource "aws_ecs_cluster" "cluster" {
  #  tags = local.default_tags
  tags = merge(local.default_tags, {
    yor_trace = "00c8c610-747e-438f-a49d-22fe94a11cf1"
  })
}