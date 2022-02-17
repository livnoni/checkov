# pass

resource "aws_appsync_graphql_api" "all" {
  authentication_type = "API_KEY"
  name                = "example"

  log_config {
    cloudwatch_logs_role_arn = "aws_iam_role.example.arn"
    field_log_level          = "ALL"
  }
  tags = {
    yor_trace = "52cb3242-cbd4-4b09-9f7f-538e68af5117"
  }
}

resource "aws_appsync_graphql_api" "error" {
  authentication_type = "API_KEY"
  name                = "example"

  log_config {
    cloudwatch_logs_role_arn = "aws_iam_role.example.arn"
    field_log_level          = "ERROR"
  }
  tags = {
    yor_trace = "f76278e6-f6d3-4f6c-9b18-a45151e49994"
  }
}

# fail

resource "aws_appsync_graphql_api" "none" {
  authentication_type = "API_KEY"
  name                = "example"

  log_config {
    cloudwatch_logs_role_arn = "aws_iam_role.example.arn"
    field_log_level          = "NONE"
  }
  tags = {
    yor_trace = "ba85329d-c43e-462d-85e6-3a00ea70f2eb"
  }
}
