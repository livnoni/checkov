resource "aws_vpc" "not_ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "352a55f6-bf13-4c7e-8c67-1fde106e731b"
  }
}

resource "aws_vpc" "not_ok_vpc_2" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "a915ac51-248a-4eba-bd5b-fa3d6169c80a"
  }
}

resource "aws_vpc" "not_ok_vpc_3" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "0114a13b-a16a-4136-8fee-87ceaef020c2"
  }
}

resource "aws_vpc" "ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "b35d7335-105c-4b96-8dc7-4fa8b7e8520d"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.ok_vpc.id
  tags = {
    yor_trace = "767b3366-5b84-46c1-909e-674c7d13436e"
  }
}

resource "aws_default_security_group" "default_2" {
  vpc_id = aws_vpc.not_ok_vpc_2.id

  ingress {
    protocol  = "-1"
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "fa3dc325-55fd-4876-ad63-e5195afeecf3"
  }
}

resource "aws_default_security_group" "default_3" {
  vpc_id = aws_vpc.not_ok_vpc_3.id
  tags = {
    yor_trace = "bdb4566f-545b-4af3-8a1c-1ab7651b8da4"
  }
}

resource "aws_security_group_rule" "default_sg_rule" {
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  type              = "-1"
  security_group_id = aws_default_security_group.default_3.id
}
