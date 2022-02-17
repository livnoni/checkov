# pass

resource "aws_appsync_graphql_api" "enabled" {
  authentication_type = "API_KEY"
  name                = "example"

  log_config {
    cloudwatch_logs_role_arn = "aws_iam_role.example.arn"
    field_log_level          = "ERROR"
  }
  tags = {
    yor_trace = "cd61c13f-f193-46a3-bcde-13c0a18dd8c9"
  }
}

# fail

resource "aws_appsync_graphql_api" "default" {
  authentication_type = "API_KEY"
  name                = "example"
  tags = {
    yor_trace = "d974c33c-68de-47a2-a32a-93a5084ece12"
  }
}
