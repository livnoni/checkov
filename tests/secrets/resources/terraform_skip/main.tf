resource "aws_lambda_function" "skip" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "exports.test"

  source_code_hash = filebase64sha256("lambda_function_payload.zip")
  runtime          = "nodejs12.x"

  environment {
    variables = {
      access_key = "AKIAIOSFODNN7EXAMPLE" #checkov:skip=CKV_SECRET_2:example
      secret_key = ""
    }
  }
  tags = {
    yor_trace = "0bb7701a-708a-4756-8322-fb3547b901cb"
  }
}

resource "aws_lambda_function" "wrong_skip" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "exports.test"

  source_code_hash = filebase64sha256("lambda_function_payload.zip")
  runtime          = "nodejs12.x"

  environment {
    variables = {
      access_key = "AKIAIOS3F6KN7EXAMPLE" #checkov:skip=CKV_SECRET_5:wrong check id
      secret_key = ""
    }
  }
  tags = {
    yor_trace = "6c0104d8-285e-44cf-b348-1c9d65ff11ed"
  }
}
