resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name      = "tf-example"
    yor_trace = "65726dd7-d044-45df-9a46-32d75d39fc73"
  }
}

resource "aws_subnet" "subnet_public_ip" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "172.16.10.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name      = "first-tf-example"
    yor_trace = "5814f852-36c3-4295-961c-8bd8b372fc08"
  }
}

resource "aws_subnet" "subnet_not_public_ip" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name      = "second-tf-example"
    yor_trace = "7c078855-2a53-47a4-b647-7778198662b4"
  }
}


resource "aws_default_security_group" "default_security_group_open" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    protocol    = -1
    self        = true
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "5974e35d-b747-4237-aeba-c4e9c1231753"
  }
}

resource "aws_default_security_group" "default_security_group_closed" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    protocol  = -1
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
    yor_trace = "b2adff0d-46b8-4420-a3d2-020937cee39f"
  }
}

resource "aws_instance" "with_open_def_security_groups" {
  ami           = "ami-0"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  security_groups = [aws_default_security_group.default_security_group_open.id]
  tags = {
    yor_trace = "49908afc-f90e-45e4-b67c-c734f1130663"
  }
}

resource "aws_instance" "with_closed_def_security_groups" {
  ami           = "ami-1"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  security_groups = [aws_default_security_group.default_security_group_closed.id]
  tags = {
    yor_trace = "fe9a4f14-707a-4040-b9a8-2a8738fd9a7f"
  }
}


resource "aws_instance" "with_open_security_groups" {
  ami           = "ami-2"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    yor_trace = "abe9b2fa-389b-4259-a2be-90149c243da4"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name      = "allow_tls"
    yor_trace = "5f942f40-5898-4e6a-abf6-47ea0a8e2c5a"
  }
}


resource "aws_instance" "with_subnet_public" {
  ami           = "ami-3"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  subnet_id = aws_subnet.subnet_public_ip.id
  tags = {
    yor_trace = "08bd1aab-d55f-4c79-bf4c-0c98bfa58858"
  }
}

resource "aws_instance" "with_subnet_not_public" {
  ami           = "ami-4"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  subnet_id = aws_subnet.subnet_not_public_ip.id
  tags = {
    yor_trace = "ad8b4b74-dfa7-4f21-b3df-c41d69a7da83"
  }
}