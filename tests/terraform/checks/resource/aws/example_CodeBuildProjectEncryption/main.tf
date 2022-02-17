resource "aws_codebuild_project" "fail" {
  name = "fail-project"
  artifacts {
    type                = S3
    encryption_disabled = true
  }

  tags = {
    yor_trace = "467f2073-2971-4925-af13-f7834e594c6e"
  }
}

resource "aws_codebuild_project" "no_artifacts_encryption_ignored" {
  name = "no-art-project"
  artifacts {
    type                = "NO_ARTIFACTS"
    encryption_disabled = true
  }
  tags = {
    yor_trace = "e235a236-688f-4f3c-b17c-10f135d52cdd"
  }
}

resource "aws_codebuild_project" "success_no_encryption_disabled" {
  name = "default-project"
  artifacts {
    type = "S3"
  }
  tags = {
    yor_trace = "67124645-9e4e-43a4-a172-0dcd18df637e"
  }
}

resource "aws_codebuild_project" "success" {
  name = "success-project"
  artifacts {
    type                = "S3"
    encryption_disabled = false
  }
  tags = {
    yor_trace = "3c502d44-ba97-49a1-81eb-a71ec476396b"
  }
}
