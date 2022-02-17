resource "aws_ebs_volume" "ebs_good" {
  availability_zone = "us-west-2a"
  size              = 40

  tags = {
    Name      = "HelloWorld"
    yor_trace = "de3ffc5c-6380-4393-a3d4-a0c6875c67b2"
  }
}

resource "aws_ebs_volume" "ebs_bad" {
  availability_zone = "us-west-2a"
  size              = 40

  tags = {
    Name      = "HelloWorld"
    yor_trace = "4f21b3ba-6bc9-4029-ad77-2bf6d4f56582"
  }
}

resource "aws_backup_selection" "backup_good" {
  iam_role_arn = "arn"
  name         = "tf_example_backup_selection"
  plan_id      = "123456"

  resources = [
    aws_ebs_volume.ebs_good.arn
  ]
}

resource "aws_backup_selection" "backup_bad" {
  iam_role_arn = "arn"
  name         = "tf_example_backup_selection"
  plan_id      = "123456"

  resources = [
  ]
}
