resource "aws_instance" "fail" {
  image_id      = "ami-123"
  instance_type = "t2.micro"
  root_block_device {
    encrypted = False
  }
  tags = {
    yor_trace = "eff3e8e1-2eed-4aed-b4c0-ad78539be80f"
  }
}

resource "aws_instance" "fail2" {
  image_id      = "ami-123"
  instance_type = "t2.micro"
  root_block_device {}
  tags = {
    yor_trace = "1bafee9c-4cf8-4c18-8c33-8192d9f04f06"
  }
}

resource "aws_instance" "fail3" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  root_block_device {
    volume_type = "gp2"
    volume_size = var.root_volume_size
    encrypted   = true
  }


  ebs_block_device {
    volume_type = "gp2"
    volume_size = var.ebs_volume_size
    device_name = "/dev/xvdb"
    encrypted   = false
  }
  tags = {
    yor_trace = "65c1c8c2-fa8b-4438-864e-73264d6b3a3f"
  }
}

resource "aws_instance" "fail4" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  ebs_block_device {
    volume_type = "gp2"
    volume_size = var.ebs_volume_size
    device_name = "/dev/xvdb"
    encrypted   = false
  }
  tags = {
    yor_trace = "e07b4791-de67-4352-93cd-fa7587f2fd84"
  }
}

resource "aws_instance" "fail5" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    yor_trace = "5e769bf8-9721-4b77-9d91-c614fb655722"
  }
}

# empty array defaults

variable "empty_list" {
  default = []
}

resource "aws_instance" "fail_empty_root_list" {
  image_id      = "ami-123"
  instance_type = "t2.micro"

  root_block_device = "${var.empty_list}"
  tags = {
    yor_trace = "7528e02e-820b-4d5a-b921-87544039a539"
  }
}

resource "aws_instance" "fail_empty_ebs_list" {
  image_id      = "ami-123"
  instance_type = "t2.micro"

  root_block_device = {
    volume_type = "gp2"
    volume_size = var.root_volume_size
    encrypted   = true
  }

  ebs_block_device = "${var.empty_list}"
  tags = {
    yor_trace = "02cab5f1-fafd-4c98-b954-9b960a94d8a4"
  }
}

# pass

resource "aws_instance" "pass" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  root_block_device {
    volume_type = "gp2"
    volume_size = var.root_volume_size
    snapshot_id = "snap-1234"
  }
  tags = {
    yor_trace = "b3d557f5-20ab-4b9c-8b07-c83bec975da0"
  }
}
resource "aws_instance" "pass2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  root_block_device {
    volume_type = "gp2"
    volume_size = var.root_volume_size
    encrypted   = true
  }
  tags = {
    yor_trace = "53e468de-34e0-4e43-9760-be57e570793b"
  }
}

resource "aws_instance" "pass3" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  ebs_block_device {
    volume_type = "gp2"
    volume_size = var.ebs_volume_size
    device_name = "/dev/xvdb"
    encrypted   = true
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = var.root_volume_size
    encrypted   = true
  }

  tags = {
    yor_trace = "bd791e80-e300-4624-bc9a-4dedbf7eb520"
  }
}

resource "aws_launch_configuration" "pass" {
  name_prefix                 = "elk"
  image_id                    = data.aws_ami.elk.image_id
  iam_instance_profile        = aws_iam_instance_profile.elk.name
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.elk.id]
  associate_public_ip_address = false

  lifecycle {
    create_before_destroy = true
  }

  root_block_device {
    encrypted = var.encrypted
  }
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}

resource "aws_launch_configuration" "pass2" {
  name_prefix                 = "elk"
  image_id                    = data.aws_ami.elk.image_id
  iam_instance_profile        = aws_iam_instance_profile.elk.name
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.elk.id]
  associate_public_ip_address = false

  lifecycle {
    create_before_destroy = true
  }

  root_block_device {
    encrypted = var.encrypted
  }

  ephemeral_block_device {
    device_name  = "somedisk"
    virtual_name = "fred"
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}

resource "aws_launch_configuration" "fail" {
  name_prefix                 = "elk"
  image_id                    = data.aws_ami.elk.image_id
  iam_instance_profile        = aws_iam_instance_profile.elk.name
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.elk.id]
  associate_public_ip_address = false

  lifecycle {
    create_before_destroy = true
  }

  root_block_device {
    encrypted = false
  }
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}

variable "encrypted" {
  description = "Root block device encryption"
  type        = bool
  default     = true
}