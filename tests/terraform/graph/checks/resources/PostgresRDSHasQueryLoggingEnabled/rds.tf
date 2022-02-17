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
    yor_trace = "4a61a463-5680-41f6-b382-1d24400886a3"
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
    yor_trace = "78e1a85b-7fb7-46d6-9329-7b8ecd31949d"
  }
}

# 10+ parameters

resource "aws_rds_cluster" "pass_many_parameters" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-postgresql"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
  master_username         = "foo"
  master_password         = "bar"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"

  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.pass_many_parameters.name
  tags = {
    yor_trace = "63f864db-a9ee-4b93-bf87-8028f4440fbf"
  }
}

resource "aws_rds_cluster_parameter_group" "pass_many_parameters" {
  name        = "rds-cluster-pg-pass"
  family      = "aurora-postgresql11"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "fake_1"
    value = "fake_1"
  }

  parameter {
    name  = "fake_2"
    value = "fake_2"
  }

  parameter {
    name  = "fake_3"
    value = "fake_3"
  }

  parameter {
    name  = "fake_4"
    value = "fake_4"
  }

  parameter {
    name  = "fake_5"
    value = "fake_5"
  }

  parameter {
    name  = "fake_6"
    value = "fake_6"
  }

  parameter {
    name  = "fake_7"
    value = "fake_7"
  }

  parameter {
    name  = "fake_8"
    value = "fake_8"
  }

  parameter {
    name  = "fake_9"
    value = "fake_9"
  }

  parameter {
    name  = "fake_10"
    value = "fake_10"
  }

  parameter {
    name  = "log_statement"
    value = "all"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "250ms"
  }
  tags = {
    yor_trace = "fc98f1af-b7e2-4f53-85c8-1c8640318fb7"
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
    yor_trace = "0d198a7e-a595-4d64-920d-1c5af0723f6e"
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
    yor_trace = "c73f82e7-d9a8-4afe-9400-8d34cb97f18c"
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
    yor_trace = "eb9f3a51-30ed-4cee-8eeb-0cd6ccc7e427"
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
    yor_trace = "008a0dfd-9144-4577-a195-320b493786f6"
  }
}



