resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "69a18549-b01e-4c9e-9e3c-1c3f6fb24b6e"
  }
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
  tags = {
    yor_trace = "495a7de8-2d62-49db-9b19-3a3167712f94"
  }
}

resource "aws_instance" "example" {
  ami                         = "ami-005e54dee72cc1d00"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  tags = {
    yor_trace = "4660fcf8-e954-4273-8fbf-c3e47bb2e494"
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id
  tags = {
    yor_trace = "982b06bb-fea0-4228-82c7-f1c52d42b07f"
  }
}

resource "aws_route_table" "aws_route_table_ok_1" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }
  tags = {
    yor_trace = "5e055473-3b03-4bdd-b070-284e80ffc864"
  }
}

resource "aws_route_table" "aws_route_table_ok_2" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block  = "10.0.0.0/24"
    instance_id = aws_instance.example.id
  }
  tags = {
    yor_trace = "e3eb88d9-b86d-4245-bb86-03ba6ade07cd"
  }
}

resource "aws_route_table" "aws_route_table_not_ok" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = aws_instance.example.id
  }
  tags = {
    yor_trace = "202be56b-9cca-4a33-afa0-bfc311330551"
  }
}

resource "aws_route" "aws_route_ok_1" {
  route_table_id         = aws_route_table.example.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.example.id
}

resource "aws_route" "aws_route_ok_2" {
  route_table_id         = aws_route_table.example.id
  destination_cidr_block = "10.0.0.0/24"
  instance_id            = aws_instance.example.id
}

resource "aws_route" "aws_route_not_ok" {
  route_table_id         = aws_route_table.example.id
  destination_cidr_block = "0.0.0.0/0"
  instance_id            = aws_instance.example.id
}