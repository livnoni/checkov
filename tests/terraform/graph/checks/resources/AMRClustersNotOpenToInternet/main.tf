resource "aws_emr_cluster" "cluster_ok" {
  name          = "emr-test-arn"
  release_label = "emr-4.6.0"
  applications  = ["Spark"]

  ec2_attributes {
    emr_managed_master_security_group = aws_security_group.block_access_ok.id
    emr_managed_slave_security_group  = aws_security_group.block_access_ok.id
    instance_profile                  = "connected_to_aws_iam_instance_profile"
  }
  tags = {
    yor_trace = "2a205482-7323-42b3-9f8e-670c3dc3b6ae"
  }
}

resource "aws_security_group" "block_access_ok" {
  name        = "block_access"
  description = "Block all traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.1/10"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.10/10"]
  }
  tags = {
    yor_trace = "8200578f-f8fd-4f81-8cbb-2516c4adc5d3"
  }
}

resource "aws_emr_cluster" "cluster_not_connected" {
  name          = "emr-test-arn"
  release_label = "emr-4.6.0"
  applications  = ["Spark"]

  ec2_attributes {
    instance_profile = "connected_to_aws_iam_instance_profile"
  }
  tags = {
    yor_trace = "c3f359ae-eec6-455b-8776-adb73b31f044"
  }
}


resource "aws_emr_cluster" "cluster_connected_to_wrong_group" {
  name          = "emr-test-arn"
  release_label = "emr-4.6.0"
  applications  = ["Spark"]

  ec2_attributes {
    emr_managed_master_security_group = aws_security_group.block_access_not_ok.id
    emr_managed_slave_security_group  = aws_security_group.block_access_not_ok.id
    instance_profile                  = "connected_to_aws_iam_instance_profile"
  }
  tags = {
    yor_trace = "871f6524-971d-474c-a8f8-0c3c4a7a7e1f"
  }
}

resource "aws_security_group" "block_access_not_ok" {
  name        = "block_access"
  description = "Block all traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "758036df-d551-4841-8ac7-2493a2655e9f"
  }
}
