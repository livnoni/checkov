resource "aws_lambda_function" "fail" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  environment {
    test = "true"
  }
  tags = {
    yor_trace = "796a4328-7686-47a9-865f-5db351ee5777"
  }
}

resource "aws_lambda_function" "failkmsnovars" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  kms_key_arn = aws_kms_key.anyoldguff.arn
  tags = {
    yor_trace = "e4a581bc-bbdb-4846-99ec-fbd4243c518f"
  }
}

resource "aws_lambda_function" "ignore" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  tags = {
    yor_trace = "816721e2-35c2-4c2b-854c-7ebad6d6272e"
  }
}

resource "aws_lambda_function" "pass" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  environment {
    test = "true"
  }
  kms_key_arn = aws_kms_key.anyoldguff.arn
  tags = {
    yor_trace = "c16ba747-831c-47e0-aa8d-47a2fa6565d9"
  }
}

resource "aws_lambda_function" "failasempty" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  kms_key_arn = ""
  tags = {
    yor_trace = "d69e956a-00a6-4a4d-a406-9761ca36e5d1"
  }
}
