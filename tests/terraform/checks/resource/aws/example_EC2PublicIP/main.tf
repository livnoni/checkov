# pass

# EC2 instance

resource "aws_instance" "default" {
  ami           = "ami-12345"
  instance_type = "t3.micro"
  tags = {
    yor_trace = "2950aca8-63a3-4e44-b702-81af5b3ba599"
  }
}

resource "aws_instance" "private" {
  ami           = "ami-12345"
  instance_type = "t3.micro"

  associate_public_ip_address = false
  tags = {
    yor_trace = "6ddc3021-9715-48ab-8bff-e790f7a0f007"
  }
}

# launch template

resource "aws_launch_template" "default" {
  image_id      = "ami-12345"
  instance_type = "t3.micro"
  tags = {
    yor_trace = "74da7192-5d4a-4f31-8a9c-c8068697a9ed"
  }
}

resource "aws_launch_template" "private" {
  image_id      = "ami-12345"
  instance_type = "t3.micro"

  network_interfaces {
    associate_public_ip_address = false
  }
  tags = {
    yor_trace = "7aa6430f-d097-41f0-850c-88c780035d40"
  }
}

# fail

# EC2 instance

resource "aws_instance" "public" {
  ami           = "ami-12345"
  instance_type = "t3.micro"

  associate_public_ip_address = true
  tags = {
    yor_trace = "d48012f2-e7a8-429e-858d-2659d301191a"
  }
}

# launch template

resource "aws_launch_template" "public" {
  image_id      = "ami-12345"
  instance_type = "t3.micro"

  network_interfaces {
    associate_public_ip_address = true
  }
  tags = {
    yor_trace = "0890aaa9-562e-4eef-8908-4b0ad3f44623"
  }
}
