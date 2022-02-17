# pass

resource "aws_mq_broker" "enabled" {
  broker_name        = "example"
  engine_type        = "ActiveMQ"
  engine_version     = "5.16.3"
  host_instance_type = "mq.t3.micro"

  user {
    password = "admin123"
    username = "admin"
  }

  logs {
    general = true
  }
  tags = {
    yor_trace = "00cc426e-32d7-40c5-8829-5eb83781e6fb"
  }
}

# fail

resource "aws_mq_broker" "default" {
  broker_name        = "example"
  engine_type        = "ActiveMQ"
  engine_version     = "5.16.3"
  host_instance_type = "mq.t3.micro"

  user {
    password = "admin123"
    username = "admin"
  }
  tags = {
    yor_trace = "6878d089-b4d0-491d-acbf-62495ca20a14"
  }
}

resource "aws_mq_broker" "disabled" {
  broker_name        = "example"
  engine_type        = "ActiveMQ"
  engine_version     = "5.16.3"
  host_instance_type = "mq.t3.micro"

  user {
    password = "admin123"
    username = "admin"
  }

  logs {
    general = false
  }
  tags = {
    yor_trace = "258ad873-3825-4d88-b1cb-8520ae3bf41a"
  }
}
