
resource "aws_redshift_parameter_group" "failasfalse" {
  name   = var.param_group_name
  family = "redshift-1.0"

  parameter {
    name  = "require_ssl"
    value = "false"
  }

  parameter {
    name  = "enable_user_activity_logging"
    value = "true"
  }
  tags = {
    yor_trace = "43cbc921-27ff-490f-906e-6da8d3359bb2"
  }
}


resource "aws_redshift_parameter_group" "fail" {
  name   = var.param_group_name
  family = "redshift-1.0"

  tags = {
    yor_trace = "11aa5bee-72dc-4d40-b734-320df44407e9"
  }
}


resource "aws_redshift_parameter_group" "pass" {
  name   = var.param_group_name
  family = "redshift-1.0"

  parameter {
    name  = "require_ssl"
    value = "true"
  }

  parameter {
    name  = "enable_user_activity_logging"
    value = "true"
  }
  tags = {
    yor_trace = "96dfa949-8994-40f3-8a29-2a9f3ecb967d"
  }
}

resource "aws_redshift_parameter_group" "passbutbool" {
  name   = var.param_group_name
  family = "redshift-1.0"

  parameter {
    name  = "require_ssl"
    value = true
  }

  parameter {
    name  = "enable_user_activity_logging"
    value = "true"
  }
  tags = {
    yor_trace = "6489a476-0b3f-4b04-8e3e-d8d5d8ab3e98"
  }
}