resource "aws_lambda_function" "this" {
  count = 0

  function_name = "lambda_function_name"
  role          = ""
  handler       = ""
  runtime       = ""
  tags = {
    yor_trace = "4fc3d7a6-7f55-49be-b4e8-9a88ca118607"
  }
}
