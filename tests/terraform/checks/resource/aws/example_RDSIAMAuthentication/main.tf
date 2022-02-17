# pass

resource "aws_db_instance" "enabled_mysql" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = true
  tags = {
    yor_trace = "45435446-f314-4689-8d16-6ad18dde17e0"
  }
}

resource "aws_db_instance" "enabled_postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = true
  tags = {
    yor_trace = "83c2563e-31b9-4b56-895a-69e2c518d98f"
  }
}

# failure

resource "aws_db_instance" "default_mysql" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"
  tags = {
    yor_trace = "0ef38dc8-3280-4b05-9b2f-3fdc35740962"
  }
}

resource "aws_db_instance" "default_postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"
  tags = {
    yor_trace = "7e4dd703-ee4c-4092-b76f-b1174db2ef8c"
  }
}

resource "aws_db_instance" "disabled_mysql" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = false
  tags = {
    yor_trace = "0b06cf7c-5ba5-4abe-97b8-5729b3230776"
  }
}

resource "aws_db_instance" "disabled_postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = false
  tags = {
    yor_trace = "27f7ea24-b462-4f95-a658-ad4bacb07c53"
  }
}

# unknown

resource "aws_db_instance" "mariadb" {
  allocated_storage = 5
  engine            = "mariadb"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"
  tags = {
    yor_trace = "734c5f9e-db36-4fde-b4e8-37a21e303316"
  }
}
