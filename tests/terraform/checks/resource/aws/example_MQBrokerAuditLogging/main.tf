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
    audit   = true
  }
  tags = {
    yor_trace = "373c71ef-a61e-46a2-a797-75feb8c07626"
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
    yor_trace = "4e526a16-7534-4c22-a432-ba35e9a17755"
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
    audit   = false
  }
  tags = {
    yor_trace = "e5b10a60-2ad6-4e17-b5a8-b405f951aea9"
  }
}


resource "aws_mq_broker" "unknown" {
  broker_name = "example"
  engine_type = "RabbitMQ"

  host_instance_type = "mq.t3.micro"

  logs {
    general = false
  }
  tags = {
    yor_trace = "750dadc8-34dd-4ef3-86f8-0c6aadd26235"
  }
}