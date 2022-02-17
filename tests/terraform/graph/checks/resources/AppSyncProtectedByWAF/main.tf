# pass

resource "aws_appsync_graphql_api" "pass" {
  authentication_type = "API_KEY"
  name                = "example"
  tags = {
    yor_trace = "5a4160f1-c802-469f-9215-e9fd7a192c24"
  }
}

resource "aws_wafv2_web_acl_association" "pass" {
  resource_arn = aws_appsync_graphql_api.pass.arn
  web_acl_arn  = aws_wafv2_web_acl.example.arn
}

# fail

resource "aws_appsync_graphql_api" "fail" {
  authentication_type = "API_KEY"
  name                = "example"
  tags = {
    yor_trace = "15370618-ab71-423e-b9dd-fc27468718bc"
  }
}
