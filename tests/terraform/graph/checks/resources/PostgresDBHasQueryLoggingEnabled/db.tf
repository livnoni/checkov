resource "aws_db_instance" "pass" {
  # checkov:skip=CKV_AWS_129: ADD REASON
  # checkov:skip=CKV_AWS_157: ADD REASON
  # checkov:skip=CKV_AWS_118: ADD REASON
  # checkov:skip=CKV_AWS_16: ADD REASON
  # checkov:skip=CKV_AWS_161: ADD REASON
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  parameter_group_name = aws_db_parameter_group.pass.id
  tags = {
    yor_trace = "0feaa2f7-ae25-42dd-8d30-f89657f11c48"
  }
}

resource "aws_db_parameter_group" "pass" {
  name_prefix = "my_name"
  family      = "postgres10"

  parameter {
    name  = "log_statement"
    value = "ddl"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = 1000
  }
  tags = {
    yor_trace = "34be93f2-3e58-4368-8cf7-9a6f83ba9425"
  }
}

resource "aws_db_instance" "pass2" {
  # checkov:skip=CKV_AWS_157: ADD REASON
  # checkov:skip=CKV_AWS_16: ADD REASON
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  parameter_group_name = aws_db_parameter_group.pass.name
  tags = {
    yor_trace = "c3275d85-1895-42d7-b821-2291f133b540"
  }
}


//no parameter_group_name set
resource "aws_db_instance" "fail" {
  engine         = "postgres"
  instance_class = "db.t3.micro"
  name           = "mydb"
  tags = {
    yor_trace = "f0668ee4-c27e-4969-8bad-9befa9d30ca5"
  }
}

resource "aws_db_instance" "fail3" {
  # checkov:skip=CKV_AWS_118: ADD REASON
  # checkov:skip=CKV_AWS_16: ADD REASON
  # checkov:skip=CKV_AWS_161: ADD REASON
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  parameter_group_name = aws_db_parameter_group.fail.id
  tags = {
    yor_trace = "c0c3bb03-6432-433a-be5a-13526ac77a3c"
  }
}

resource "aws_db_instance" "fail4" {
  # checkov:skip=CKV_AWS_157: ADD REASON
  # checkov:skip=CKV_AWS_161: ADD REASON
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  parameter_group_name = aws_db_parameter_group.fail2.id
  tags = {
    yor_trace = "f7a966d1-6246-475b-b633-c09052436b14"
  }
}


//not postgres
resource "aws_db_instance" "ignore" {
  # checkov:skip=CKV_AWS_161: ADD REASON
  # checkov:skip=CKV_AWS_157: ADD REASON
  # checkov:skip=CKV_AWS_129: ADD REASON
  # checkov:skip=CKV_AWS_16: ADD REASON
  engine         = "mysql"
  instance_class = "db.t3.micro"
  name           = "mydb"
  tags = {
    yor_trace = "49e89035-d5ef-4cf1-b472-8eaaff4e937d"
  }
}

// no postgres
resource "aws_db_instance" "ignore2" {
  # checkov:skip=CKV_AWS_129: ADD REASON
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  tags = {
    yor_trace = "4cf0e572-051e-4e6d-9a0b-10ea7914efcb"
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_db_instance" "ignore3" {
  identifier                   = "xxx-our-unique-id"
  allocated_storage            = 1000
  storage_type                 = "gp2"
  copy_tags_to_snapshot        = true
  engine                       = "sqlserver-se"
  engine_version               = "15.00.4043.16.v1"
  license_model                = "license-included"
  instance_class               = "db.r5.4xlarge"
  name                         = ""
  username                     = "sa"
  password                     = var.password
  port                         = 1433
  publicly_accessible          = false
  security_group_names         = []
  vpc_security_group_ids       = ["sg-xxxxx"]
  db_subnet_group_name         = "dbsubnet"
  performance_insights_enabled = true
  option_group_name            = "sql-std-2019"
  deletion_protection          = true
  max_allocated_storage        = 1500
  parameter_group_name         = "sql-server-2019-std"
  character_set_name           = "SQL_Latin1_General_CP1_CS_AS"
  # checkov:skip=CKV_AWS_157:Web db, acceptable risk until Resize
  multi_az                        = false
  backup_retention_period         = 35
  enabled_cloudwatch_logs_exports = ["agent", "error"]
  backup_window                   = "11:17-11:47"
  maintenance_window              = "sat:07:13-sat:08:43"
  final_snapshot_identifier       = "xxx-unique-name-final"
  tags = {
    yor_trace = "cee3d0c6-bfd0-4d56-9049-4260f1c9d176"
  }
}

