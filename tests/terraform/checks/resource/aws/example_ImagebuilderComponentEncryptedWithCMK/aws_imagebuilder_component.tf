resource "aws_imagebuilder_component" "fail" {
  data = yamlencode({
    phases = [{
      name = "build"
      steps = [{
        action = "ExecuteBash"
        inputs = {
          commands = ["echo 'hello world'"]
        }
        name      = "example"
        onFailure = "Continue"
      }]
    }]
    schemaVersion = 1.0
  })
  name     = "examplea"
  platform = "Linux"
  version  = "1.0.0"
  tags = {
    yor_trace = "4b4fce57-6715-4f2c-ab6e-01102603a2cf"
  }
}

resource "aws_imagebuilder_component" "pass" {
  data = yamlencode({
    phases = [{
      name = "build"
      steps = [{
        action = "ExecuteBash"
        inputs = {
          commands = ["echo 'hello world'"]
        }
        name      = "example"
        onFailure = "Continue"
      }]
    }]
    schemaVersion = 1.0
  })
  kms_key_id = aws_kms_key.test.arn
  name       = "examplea"
  platform   = "Linux"
  version    = "1.0.0"
  tags = {
    yor_trace = "da8ce201-23cb-4ef3-8c49-f0e492bb3fd1"
  }
}