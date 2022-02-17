resource "aws_athena_workgroup" "pass" {
  name = "wg-encrypted"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://mys3bucket"
      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = "mykmsarn"
      }
    }
  }
  tags = {
    yor_trace = "22be6b44-4ff7-466c-acb7-f9b1d4f33955"
  }
}

resource "aws_athena_workgroup" "fail" {
  name = "wg-non-encrypted"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://mys3bucket"
    }
  }
  tags = {
    yor_trace = "db334dab-6f94-45fd-95c4-1882e616c5f5"
  }
}

