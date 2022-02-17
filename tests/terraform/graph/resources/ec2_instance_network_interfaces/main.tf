resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name      = "tf-example"
    Env       = "prod"
    yor_trace = "f06616aa-b207-4234-b6d3-4d6dc9c7d02c"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name      = "tf-example"
    Env       = "prod"
    yor_trace = "49685c1e-12da-44ff-9528-f8069a7848ff"
  }
}

resource "aws_network_interface" "network_interface_foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name      = "primary_network_interface"
    Env       = "prod"
    yor_trace = "05875e16-b80e-4f2d-b623-27979ef0031c"
  }
}

resource "aws_network_interface" "network_interface_goo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name      = "secondary_network_interface"
    Env       = "dev"
    yor_trace = "7f90e307-dc23-4d63-a9de-2579bbef78bd"
  }
}

resource "aws_instance" "instance_foo" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.network_interface_foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
  tags = {
    yor_trace = "894b5eea-1457-4c79-bd86-cc278413fb5b"
  }
}

resource "aws_instance" "instance_bar" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  tags = {
    Env       = "prod"
    yor_trace = "caaee45e-0069-40be-a32b-c0d44287c17b"
  }
}

resource "aws_vpc" "other_vpc" {
  cidr_block = "124.16.0.0/16"

  tags = {
    Name      = "not_connected"
    yor_trace = "2220e2be-4263-4830-9809-afd30c4b6758"
  }
}