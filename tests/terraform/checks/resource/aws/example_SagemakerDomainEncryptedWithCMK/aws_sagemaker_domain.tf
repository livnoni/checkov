resource "aws_sagemaker_domain" "pass" {
  domain_name = "examplea"
  auth_mode   = "IAM"
  vpc_id      = aws_vpc.test.id
  subnet_ids  = [aws_subnet.test.id]
  kms_key_id  = aws_kms_key.test.arn

  default_user_settings {
    execution_role = aws_iam_role.test.arn
  }

  retention_policy {
    home_efs_file_system = "Delete"
  }
  tags = {
    yor_trace = "4c89fd2d-223d-4e80-ba48-efbcd528894b"
  }
}

resource "aws_sagemaker_domain" "fail" {
  domain_name = "examplea"
  auth_mode   = "IAM"
  vpc_id      = aws_vpc.test.id
  subnet_ids  = [aws_subnet.test.id]

  default_user_settings {
    execution_role = aws_iam_role.test.arn
  }

  retention_policy {
    home_efs_file_system = "Delete"
  }
  tags = {
    yor_trace = "3ab57e75-5e80-4c7f-8287-641ea2a9005d"
  }
}