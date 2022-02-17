resource "aws_instance" "web" {
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t2.micro"

  tags = {
    Name      = "HelloWorld"
    yor_trace = "511c2bcf-f6bd-4d81-a7c0-77c7e93f4df4"
  }
}

resource "aws_volume_attachment" "not_ok_attachment1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.not_ok_ebs1.id
  instance_id = aws_instance.web.id
}

resource "aws_volume_attachment" "not_ok_attachment2" {
  device_name = "/dev/sdh2"
  volume_id   = aws_ebs_volume.not_ok_ebs2.id
  instance_id = aws_instance.web.id
}

resource "aws_volume_attachment" "ok_attachment1" {
  device_name = "/dev/sdh3"
  volume_id   = aws_ebs_volume.ok_ebs2.id
  instance_id = aws_instance.web.id
}

resource "aws_ebs_volume" "not_ok_ebs1" {
  availability_zone = ""
  tags = {
    yor_trace = "73c36238-8a81-4e11-a6ea-36931a9bc5d5"
  }
}

resource "aws_ebs_volume" "not_ok_ebs2" {
  availability_zone = ""
  encrypted         = false
  tags = {
    yor_trace = "001c6f28-fa3c-41d4-b242-9b142e410ac7"
  }
}

resource "aws_ebs_volume" "ok_ebs1" {
  availability_zone = ""
  tags = {
    yor_trace = "b5fbd48f-2081-48f0-8e5a-bdedf2b6db56"
  }
}

resource "aws_ebs_volume" "ok_ebs2" {
  availability_zone = ""
  encrypted         = true
  tags = {
    yor_trace = "f74373cc-9990-4c19-9924-9d074bc685ea"
  }
}


resource "aws_volume_attachment" "ebs_at1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.not_ok_ebs1.id
  instance_id = aws_instance.web.id
}