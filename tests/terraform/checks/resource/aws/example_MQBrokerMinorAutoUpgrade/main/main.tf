
resource "aws_mq_broker" "fail" {
  broker_name = "example"

  configuration {
    id       = aws_mq_configuration.test.id
    revision = aws_mq_configuration.test.latest_revision
  }

  engine_type        = "ActiveMQ"
  engine_version     = "5.15.9"
  host_instance_type = "mq.t2.micro"
  security_groups    = [aws_security_group.test.id]

  user {
    username = "ExampleUser"
    password = "MindTheGapps"
  }

  # encryption_options {
  #   use_aws_owned_key=false
  #   kms_key_id=aws_kms_key.examplea.arn
  # }
  tags = {
    yor_trace = "91733dc9-a23c-4d63-93e9-dcb9e25022fe"
  }
}


resource "aws_mq_broker" "fail2" {
  broker_name = "example"

  configuration {
    id       = aws_mq_configuration.test.id
    revision = aws_mq_configuration.test.latest_revision
  }

  auto_minor_version_upgrade = false
  engine_type                = "ActiveMQ"
  engine_version             = "5.15.9"
  host_instance_type         = "mq.t2.micro"
  security_groups            = [aws_security_group.test.id]

  user {
    username = "ExampleUser"
    password = "MindTheGapps"
  }

  # encryption_options {
  #   use_aws_owned_key=false
  #   kms_key_id=aws_kms_key.examplea.arn
  # }
  tags = {
    yor_trace = "1d742211-afac-4f44-9aa1-d778d0750d82"
  }
}


resource "aws_mq_broker" "pass" {
  broker_name = "example"

  configuration {
    id       = aws_mq_configuration.test.id
    revision = aws_mq_configuration.test.latest_revision
  }

  auto_minor_version_upgrade = true
  engine_type                = "ActiveMQ"
  engine_version             = "5.15.9"
  host_instance_type         = "mq.t2.micro"
  security_groups            = [aws_security_group.test.id]

  user {
    username = "ExampleUser"
    password = "MindTheGapps"
  }

  # encryption_options {
  #   use_aws_owned_key=false
  #   kms_key_id=aws_kms_key.examplea.arn
  # }
  tags = {
    yor_trace = "46352b57-6913-4a3c-96f6-a97e758eb4e1"
  }
}

resource "aws_kms_key" "example" {

  tags = {
    yor_trace = "06c37871-a156-4f33-99fa-3d57f1b9c4fe"
  }
}
