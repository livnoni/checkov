//will be correct params
resource "aws_rds_cluster" "pass" {
  cluster_identifier              = "aurora-cluster-demo"
  engine                          = "aurora-postgresql"
  availability_zones              = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name                   = "mydb"
  master_username                 = "foo"
  master_password                 = "bar"
  backup_retention_period         = 5
  preferred_backup_window         = "07:00-09:00"
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.pass.name
  tags = {
    yor_trace = "9227ecaf-a581-4faa-8d1d-ec9954784e7e"
  }
}

resource "aws_rds_cluster_parameter_group" "pass" {
  name        = "rds-cluster-pg-pass"
  family      = "aurora-postgresql11"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "log_statement"
    value = "all"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "250ms"
  }
  tags = {
    yor_trace = "f2cb6f4b-16d7-4491-8edc-c94a4addd97b"
  }
}

resource "aws_rds_cluster" "fail" {
  cluster_identifier              = "aurora-cluster-demo"
  engine                          = "aurora-postgresql"
  availability_zones              = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name                   = "mydb"
  master_username                 = "foo"
  master_password                 = "bar"
  backup_retention_period         = 5
  preferred_backup_window         = "07:00-09:00"
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.fail.name
  tags = {
    yor_trace = "3dc5f34c-2b3b-4a4f-a77b-8e1b7bbba45e"
  }
}

//not correct params
resource "aws_rds_cluster_parameter_group" "fail" {
  name        = "mysql-cluster-fail"
  family      = "mysql"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
  tags = {
    yor_trace = "4cd70c0b-59dc-4b63-a989-9d0eac1d2adf"
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_rds_cluster" "fail2" {
  cluster_identifier              = "aurora-cluster-demo"
  engine                          = "aurora-postgresql"
  availability_zones              = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name                   = "mydb"
  master_username                 = "foo"
  master_password                 = "bar"
  backup_retention_period         = 5
  preferred_backup_window         = "07:00-09:00"
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.fail2.name
  tags = {
    yor_trace = "58e8f88e-1cd2-43f7-85d5-a03c49c28b5a"
  }
}

resource "aws_rds_cluster_parameter_group" "fail2" {
  name        = "rds-cluster-pg-pass"
  family      = "aurora-postgresql11"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "log_statement"
    value = "all"
  }
  tags = {
    yor_trace = "10181067-19d8-417f-8a53-24e03273035e"
  }
}



