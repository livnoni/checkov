resource "aws_eip" "ok_eip" {
  instance = aws_instance.ec2.id
  vpc      = true
  tags = {
    yor_trace = "5039076b-2235-4f8a-8147-8899f7d0223e"
  }
}

resource "aws_instance" "ec2" {
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t2.micro"

  tags = {
    Name      = "HelloWorld"
    yor_trace = "8a8efc17-a886-46cf-a753-e4aa722713ce"
  }
}

resource "aws_eip" "not_ok_eip" {
  vpc                       = true
  network_interface         = aws_network_interface.multi-ip.id
  associate_with_private_ip = "10.0.0.10"
  tags = {
    yor_trace = "0aac9491-b982-48eb-bbae-26105ac38575"
  }
}

# via aws_eip_association

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2_assoc.id
  allocation_id = aws_eip.ok_eip_assoc.id
}

resource "aws_instance" "ec2_assoc" {
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t2.micro"

  tags = {
    Name      = "Assoc"
    yor_trace = "83979e11-4c55-4ca7-857e-baae64f24d44"
  }
}

resource "aws_eip" "ok_eip_assoc" {
  vpc = true
  tags = {
    yor_trace = "62e2d08d-f510-4891-a2ee-0be18588d6da"
  }
}

# via aws_nat_gateway

resource "aws_eip" "ok_eip_nat" {
  vpc = true
  tags = {
    yor_trace = "54efbd71-f8e9-4fe7-a35c-67c42a5122b8"
  }
}

resource "aws_nat_gateway" "ok_eip_nat" {
  allocation_id = aws_eip.ok_eip_nat.id
  subnet_id     = "aws_subnet.public.id"
  tags = {
    yor_trace = "35c1b602-bd0d-4db1-ad7d-0e5f4fdf8f2e"
  }
}

resource "aws_transfer_server" "transfer_server_vpc" {
  count                  = local.count
  identity_provider_type = "SERVICE_MANAGED"
  endpoint_type          = "VPC"

  endpoint_details {
    address_allocation_ids = aws_eip.eip_ok_transer_server.*.id[count.index]
  }
  tags = {
    yor_trace = "3b7e443d-c7fe-494b-ad60-f658dcd6c522"
  }
}

resource "aws_eip" "eip_ok_transer_server" {
  count = local.count
  vpc   = true
  tags = {
    yor_trace = "94b4063b-3545-446d-9a4a-2c2441d26867"
  }
}

resource "aws_eip" "ok_eip_module" {
  count    = 1
  instance = module.example[count.index].instance_id
  vpc      = true
  tags = {
    yor_trace = "decd42db-b5a9-4185-9891-cea2609a7c89"
  }
}

resource "aws_eip" "ok_eip_data" {
  instance = data.aws_instance.id
  vpc      = true
  tags = {
    yor_trace = "783cb905-5eba-480a-88b1-adf802efd31a"
  }
}
