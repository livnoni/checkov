resource "aws_ami" "pass" {
  name                = "terraform-example"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda1"

  ebs_block_device {
    device_name = "/dev/xvda1"
    volume_size = 8
    snapshot_id = "someid"
  }

  ebs_block_device {
    device_name = "/dev/xvda2"
    volume_size = 8
    encrypted   = true
  }
  tags = {
    yor_trace = "9d8ea8fa-2145-4a37-ae36-e45cd036493e"
  }
}

resource "aws_ami" "pass2" {
  name                = "terraform-example"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda1"

  ebs_block_device {
    device_name = "/dev/xvda1"
    volume_size = 8
    encrypted   = true
  }
  tags = {
    yor_trace = "5eaac257-cc43-49bd-ad3d-8c12c08a212d"
  }
}

resource "aws_ami" "fail" {
  name                = "terraform-example"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda1"

  ebs_block_device {
    device_name = "/dev/xvda1"
    volume_size = 8
    snapshot_id = "someid"
  }

  ebs_block_device {
    device_name = "/dev/xvda2"
    volume_size = 8
    encrypted   = false
  }
  tags = {
    yor_trace = "20931f8f-44e8-4eea-9a28-ac76b6a302b2"
  }
}

resource "aws_ami" "fail2" {
  name                = "terraform-example"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda1"

  ebs_block_device {
    device_name = "/dev/xvda1"
    volume_size = 8
    encrypted   = false
  }
  tags = {
    yor_trace = "5e20d759-c7c6-4562-8c96-084ff94f575a"
  }
}

resource "aws_ami" "fail3" {
  name                = "terraform-example"
  virtualization_type = "hvm"
  root_device_name    = "/dev/xvda1"

  ebs_block_device {
    device_name = "/dev/xvda1"
    volume_size = 8
  }
  tags = {
    yor_trace = "706c3843-8a0f-4ebf-9504-c293e57995f4"
  }
}


provider "aws" {
  region = "eu-west-2"
}