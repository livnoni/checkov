# pass

resource "aws_lambda_function" "pass" {
  function_name = "test-env"
  role          = ""
  runtime       = "python3.8"

  environment {
    variables = {
      AWS_DEFAULT_REGION = "us-west-2"
    }
  }
  tags = {
    yor_trace = "c0017475-a5e2-4cc0-90b0-adc141edf119"
  }
}

resource "aws_lambda_function" "no_env" {
  function_name = "test-env"
  role          = ""
  runtime       = "python3.8"
  tags = {
    yor_trace = "2e0b4b97-f720-4149-a5dc-8cb0cf9cc70c"
  }
}

# fail

resource "aws_lambda_function" "fail" {
  function_name = "stest-env"
  role          = ""
  runtime       = "python3.8"

  environment {
    variables = {
      AWS_ACCESS_KEY_ID     = "AKIAIOSFODNN7EXAMPLE",
      AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
      AWS_DEFAULT_REGION    = "us-west-2"
    }
  }
  tags = {
    yor_trace = "0081daf7-727c-4002-b198-bf066fe50624"
  }
}
