resource "aws_ssm_parameter" "aws_ssm_parameter_ok" {
  name            = "sample"
  type            = "SecureString"
  value           = "test"
  description     = "policy test"
  tier            = "Standard"
  allowed_pattern = ".*"
  data_type       = "text"
  tags = {
    yor_trace = "091415be-3979-4d8f-8c0e-dc4d212ce5bf"
  }
}

resource "aws_ssm_parameter" "aws_ssm_parameter_not_ok" {
  name            = "sample"
  type            = "String"
  value           = "test"
  description     = "policy test"
  tier            = "Standard"
  allowed_pattern = ".*"
  data_type       = "text"
  tags = {
    yor_trace = "de46458c-1565-4eea-a0b5-aa46f87bd08d"
  }
}