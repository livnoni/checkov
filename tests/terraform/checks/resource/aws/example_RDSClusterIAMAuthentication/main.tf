# pass

resource "aws_rds_cluster" "enabled" {
  master_username = "username"
  master_password = "password"

  iam_database_authentication_enabled = true
  tags = {
    yor_trace = "eefa7e89-76fe-422c-a7ab-c3f72e0d81a7"
  }
}

# failure

resource "aws_rds_cluster" "default" {
  master_username = "username"
  master_password = "password"
  tags = {
    yor_trace = "9667511c-6e16-4dd1-9492-c00a32fd3f5f"
  }
}

resource "aws_rds_cluster" "disabled" {
  master_username = "username"
  master_password = "password"

  iam_database_authentication_enabled = false
  tags = {
    yor_trace = "465b5543-2797-4e11-8ea8-f5d8899165e5"
  }
}
