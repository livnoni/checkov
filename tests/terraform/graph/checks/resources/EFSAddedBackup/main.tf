resource "aws_backup_plan" "example" {
  name = "tf_example_backup_plan"

  rule {
    rule_name         = "tf_example_backup_rule"
    target_vault_name = aws_backup_vault.test.name
    schedule          = "cron(0 12 * * ? *)"
  }

  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "enabled"
    }
    resource_type = "EC2"
  }
  tags = {
    yor_trace = "f1c6395e-cc44-45b8-8817-976b39ec7b18"
  }
}

resource "aws_backup_selection" "ok_backup" {
  iam_role_arn = aws_iam_role.example.arn
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    aws_db_instance.example.arn,
    aws_ebs_volume.example.arn,
    aws_efs_file_system.ok_efs.arn,
  ]
}

resource "aws_efs_file_system" "ok_efs" {
  creation_token = "my-product"

  tags = {
    Name      = "MyProduct"
    yor_trace = "b167fedd-f1e4-4b71-a9f5-3c5e8e7511f4"
  }
}

resource "aws_backup_selection" "not_ok_backup" {
  iam_role_arn = aws_iam_role.example.arn
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    aws_db_instance.example.arn,
    aws_ebs_volume.example.arn
  ]
}

resource "aws_efs_file_system" "ok_efs" {
  creation_token = "my-product"

  tags = {
    Name      = "MyProduct"
    yor_trace = "b167fedd-f1e4-4b71-a9f5-3c5e8e7511f4"
  }
}

resource "aws_efs_file_system" "not_ok_efs" {
  creation_token = "my-product"

  tags = {
    Name      = "MyProduct"
    yor_trace = "142699a4-e9e7-4c78-90f5-685402114c75"
  }
}