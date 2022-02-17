# pass

resource "aws_db_instance" "postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "postgres"
  username          = "postgres"

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  tags = {
    yor_trace = "22531f7a-7ceb-457a-a2a1-8e2a1c428d61"
  }
}

resource "aws_db_instance" "mysql" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "mysql"
  username          = "mysql"

  enabled_cloudwatch_logs_exports = ["general", "error", "slowquery"]
  tags = {
    yor_trace = "7c2084b3-6722-41e3-9877-8c38a31bd202"
  }
}

# failure

resource "aws_db_instance" "default" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "mysql"
  username          = "mysql"
  tags = {
    yor_trace = "f563326f-3fd0-4b8b-a0c6-e386a4f10598"
  }
}

resource "aws_db_instance" "empty" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "mysql"
  username          = "mysql"

  enabled_cloudwatch_logs_exports = []
  tags = {
    yor_trace = "27ffc6a0-60d0-4f9b-b0b8-0d5c9aec1183"
  }
}
