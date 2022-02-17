# pass

resource "aws_glue_crawler" "enabled" {
  database_name = "aws_glue_catalog_database.example.name"
  name          = "example"
  role          = "aws_iam_role.example.arn"

  security_configuration = "aws_glue_security_configuration.example.name"
  tags = {
    yor_trace = "7ce528c1-f00d-4600-8a54-366ad2791d38"
  }
}

resource "aws_glue_dev_endpoint" "enabled" {
  name     = "example"
  role_arn = "aws_iam_role.example.arn"

  security_configuration = "aws_glue_security_configuration.example.name"
  tags = {
    yor_trace = "f9098f21-2de6-4dd5-9bf1-104508eaafee"
  }
}

resource "aws_glue_job" "enabled" {
  name     = "example"
  role_arn = "aws_iam_role.example.arn"

  security_configuration = "aws_glue_security_configuration.example.name"

  command {
    script_location = "s3://aws_s3_bucket.example.bucket/example.py"
  }
  tags = {
    yor_trace = "cb2c9329-1f6f-49cf-9c26-a20c1ef2044c"
  }
}

# fail

resource "aws_glue_crawler" "default" {
  database_name = "aws_glue_catalog_database.example.name"
  name          = "example"
  role          = "aws_iam_role.example.arn"
  tags = {
    yor_trace = "f8875b44-068e-4c3b-89b5-4b4ddb16d44e"
  }
}

resource "aws_glue_dev_endpoint" "default" {
  name     = "example"
  role_arn = "aws_iam_role.example.arn"
  tags = {
    yor_trace = "4d9e87b4-26a0-41bd-ad1f-f682bb706f5e"
  }
}

resource "aws_glue_job" "default" {
  name     = "example"
  role_arn = "aws_iam_role.example.arn"

  command {
    script_location = "s3://aws_s3_bucket.example.bucket/example.py"
  }
  tags = {
    yor_trace = "125213b0-a6bf-4b4f-a538-5173b25deb89"
  }
}
