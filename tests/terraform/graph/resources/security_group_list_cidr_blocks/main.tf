resource "aws_security_group" "failed_cidr_blocks" {
  name        = "friendly_subnets"
  description = "Allows access from friendly subnets"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  }
  tags = {
    yor_trace = "287db9ba-4701-49fc-8347-e946c7d502d2"
  }
}

resource "aws_security_group" "passed_cidr_block" {
  name        = "friendly_subnets"
  description = "Allows access from friendly subnets"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
  }
  tags = {
    yor_trace = "b32716b8-42f2-4d2a-806d-b4dd3716f0f4"
  }
}