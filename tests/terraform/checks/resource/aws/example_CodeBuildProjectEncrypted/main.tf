# pass

resource "aws_codebuild_project" "enabled" {
  name         = "example"
  service_role = "aws_iam_role.example.arn"

  encryption_key = "aws_kms_key.scanner_key.id"

  artifacts {
    type = "S3"
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "docker:dind"
    type         = "LINUX_CONTAINER"
  }
  source {
    type = "NO_SOURCE"
  }
  tags = {
    yor_trace = "9cb8f7dd-1a99-4c9a-8470-223540e07045"
  }
}

# fail

resource "aws_codebuild_project" "default" {
  name         = "example"
  service_role = "aws_iam_role.example.arn"

  artifacts {
    type = "S3"
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "docker:dind"
    type         = "LINUX_CONTAINER"
  }
  source {
    type = "NO_SOURCE"
  }
  tags = {
    yor_trace = "f70c60db-84e3-441c-8f10-9faec450524f"
  }
}

# unknown

resource "aws_codebuild_project" "no_artifacts" {
  name         = "example"
  service_role = "aws_iam_role.example.arn"

  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "docker:dind"
    type         = "LINUX_CONTAINER"
  }
  source {
    type = "NO_SOURCE"
  }
  tags = {
    yor_trace = "52115b1f-135f-4cc7-b5dd-649be31ebbbe"
  }
}
