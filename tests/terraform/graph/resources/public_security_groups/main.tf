resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name      = "tf-example"
    yor_trace = "2634bc98-ef84-4002-9bd4-663677816a20"
  }
}

resource "aws_security_group" "aws_security_group_public" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = ""
    to_port     = 0
  }
  tags = {
    yor_trace = "6c7b553d-00ed-45e2-94b2-1b31ba244ab4"
  }
}

resource "aws_security_group" "aws_security_group_private" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    cidr_blocks = ["25.09.19.92/0"]
    from_port   = 0
    protocol    = ""
    to_port     = 0
  }
  tags = {
    yor_trace = "550ef82f-2b02-4325-a6e6-d6cbc6fe0b72"
  }
}

resource "aws_db_security_group" "aws_db_security_group_public" {
  name = "rds_sg"

  ingress {
    cidr = "0.0.0.0"
  }
  tags = {
    yor_trace = "99f13a88-eaca-40b1-9059-edaec0c0cb68"
  }
}

resource "aws_db_security_group" "aws_db_security_group_private" {
  name = "rds_sg"

  ingress {
    cidr = "10.0.0.0/24"
  }
  tags = {
    yor_trace = "378102ff-1060-4900-ae01-f6d81b05bcbe"
  }
}

resource "aws_redshift_security_group" "aws_redshift_security_group_public" {
  name = "redshift-sg"

  ingress {
    cidr = "0.0.0.0"
  }
}

resource "aws_redshift_security_group" "aws_redshift_security_group_private" {
  name = "redshift-sg"

  ingress {
    cidr = "25.09.19.92/0"
  }
}

resource "aws_elasticache_security_group" "aws_elasticache_security_group_public" {
  name                 = "elasticache-security-group"
  security_group_names = [aws_security_group.aws_security_group_public.name]
}

resource "aws_elasticache_security_group" "aws_elasticache_security_group_private" {
  name                 = "elasticache-security-group"
  security_group_names = [aws_security_group.aws_security_group_private.name]
}