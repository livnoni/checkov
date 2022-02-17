# pass

resource "aws_secretsmanager_secret" "enabled1" {
  name = "secret"

  kms_key_id = var.kms_key_id
  tags = {
    yor_trace = "d4f7d0cf-5937-4474-910c-87ef1eb53458"
  }
}

resource "aws_secretsmanager_secret" "enabled2" {
  name = "secret"

  kms_key_id = "1234"
  tags = {
    yor_trace = "de1cce22-2b48-4074-86f5-8c99ac8aaed9"
  }
}

# failure

resource "aws_secretsmanager_secret" "default" {
  name = "secret"
  tags = {
    yor_trace = "9c404ba9-197e-49f8-b4c4-39f8d7228d6e"
  }
}

resource "aws_secretsmanager_secret" "default_explicit" {
  name       = "secret"
  kms_key_id = "alias/aws/secretsmanager"
  tags = {
    yor_trace = "af39fb52-65c2-4a1a-8fb7-efca18078caf"
  }
}
