resource "aws_api_gateway_rest_api" "pass" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["REGIONAL"]
  }
  tags = {
    yor_trace = "6a18f4e3-8a80-4ade-bc83-82a9cde7cc3f"
  }
}

resource "aws_api_gateway_rest_api" "private" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["PRIVATE"]
  }
  tags = {
    yor_trace = "8513c911-d1c6-435d-85a0-a186710fa02e"
  }
}

resource "aws_api_gateway_rest_api" "no_stage" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["REGIONAL"]
  }
  tags = {
    yor_trace = "00c53f3c-e16c-454a-b862-8b529e718ccb"
  }
}

resource "aws_api_gateway_rest_api" "no_assoc" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["REGIONAL"]
  }
  tags = {
    yor_trace = "7e6623a5-3449-4ccd-9334-94928a9a0094"
  }
}

resource "aws_api_gateway_stage" "no_assoc" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.no_assoc.id
  stage_name    = "example"
  tags = {
    yor_trace = "2c8f0bbc-ab0a-4105-841c-9c630069707f"
  }
}

resource "aws_api_gateway_stage" "private" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.private.id
  stage_name    = "example"
  tags = {
    yor_trace = "308d4264-0740-4100-9f0a-d91a207a0170"
  }
}

resource "aws_api_gateway_stage" "no_api" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.no_api.id
  stage_name    = "example"
  tags = {
    yor_trace = "3305bbfa-d97e-46ee-bcbd-0620cc0ff833"
  }
}

resource "aws_api_gateway_stage" "pass" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.pass.id
  stage_name    = "example"
  tags = {
    yor_trace = "c30e61ba-347f-4a58-8498-e206c11165f5"
  }
}

resource "aws_api_gateway_stage" "wafv2_pass" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.pass.id
  stage_name    = "example"
  tags = {
    yor_trace = "edb6b549-e182-40db-ab53-e0ebc77ab070"
  }
}

resource "aws_wafregional_web_acl_association" "pass" {
  resource_arn = aws_api_gateway_stage.pass.arn
  web_acl_id   = aws_wafregional_web_acl.foo.id
}

resource "aws_wafv2_web_acl_association" "pass" {
  resource_arn = aws_api_gateway_stage.wafv2_pass.arn
  web_acl_id   = aws_wafv2_web_acl.foo.id
}