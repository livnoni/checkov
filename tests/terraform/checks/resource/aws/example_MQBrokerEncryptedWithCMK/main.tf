
resource "aws_mq_broker" "pass" {
  broker_name = "example"

  configuration {
    id       = aws_mq_configuration.fail.id
    revision = aws_mq_configuration.fail.latest_revision
  }

  engine_type        = "ActiveMQ"
  engine_version     = "5.15.13"
  host_instance_type = "mq.t2.micro"
  security_groups    = [aws_security_group.test.id]

  user {
    username = "ExampleUser"
    password = "MindTheGapps"
  }

  encryption_options {
    use_aws_owned_key = false
    kms_key_id        = aws_kms_key.example.arn
  }
  tags = {
    yor_trace = "89cbf722-0368-4de6-97bd-6695f1af7e5b"
  }
}


resource "aws_mq_broker" "fail" {
  broker_name = "example"

  configuration {
    id       = aws_mq_configuration.fail.id
    revision = aws_mq_configuration.fail.latest_revision
  }

  engine_type        = "ActiveMQ"
  engine_version     = "5.15.13"
  host_instance_type = "mq.t2.micro"
  security_groups    = [aws_security_group.test.id]

  user {
    username = "ExampleUser"
    password = "MindTheGapps"
  }

  encryption_options {
    use_aws_owned_key = true
  }
  tags = {
    yor_trace = "56c3df2a-e38d-4237-bb28-1f71e2e3b913"
  }
}

resource "aws_mq_broker" "fail2" {
  broker_name = "example"

  configuration {
    id       = aws_mq_configuration.fail.id
    revision = aws_mq_configuration.fail.latest_revision
  }

  engine_type        = "ActiveMQ"
  engine_version     = "5.15.13"
  host_instance_type = "mq.t2.micro"
  security_groups    = [aws_security_group.test.id]

  user {
    username = "ExampleUser"
    password = "MindTheGapps"
  }
  tags = {
    yor_trace = "827eb947-0aa8-4cf3-ad77-b407ca902bf2"
  }
}
