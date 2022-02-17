resource "aws_lambda_function" "lambda" {

  function_name = "test"
  role          = ""

  dynamic "dead_letter_config" {
    for_each = var.dlc == null ? [] : [var.dlc]
    content {
      target_arn = dead_letter_config.value.target_arn
    }
  }
  tags = {
    yor_trace = "b5060abd-0464-4d9c-a05d-91053c7ceba4"
  }
}