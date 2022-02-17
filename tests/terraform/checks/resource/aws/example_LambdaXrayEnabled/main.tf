# pass

resource "aws_lambda_function" "active" {
  function_name = "test-env"
  role          = ""
  runtime       = "python3.8"

  tracing_config {
    mode = "Active"
  }
  tags = {
    yor_trace = "8dbb5aae-e87e-4efd-a1ee-cd07ebfc0889"
  }
}

resource "aws_lambda_function" "pass_through" {
  function_name = "test-env"
  role          = ""
  runtime       = "python3.8"

  tracing_config {
    mode = "PassThrough"
  }
  tags = {
    yor_trace = "89454687-91cf-4648-88a2-ceab74eaf582"
  }
}

# fail

resource "aws_lambda_function" "default" {
  function_name = "test-env"
  role          = ""
  runtime       = "python3.8"
  tags = {
    yor_trace = "e7b798ae-6377-4d58-8c2f-33182467ead4"
  }
}
