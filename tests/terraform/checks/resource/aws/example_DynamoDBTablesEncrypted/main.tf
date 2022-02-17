# pass

resource "aws_dynamodb_table" "cmk" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = "arn:aws:kms:us-west-2:123456789012:key/1234abcd-12ab-34cd-56ef-1234567890ab"
  }
  tags = {
    yor_trace = "254c7d49-d1fe-4723-b1bf-bdc719deaad7"
  }
}

# failure

resource "aws_dynamodb_table" "default" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }
  tags = {
    yor_trace = "e57dd46c-0ce6-4b6c-8366-837bce955fb8"
  }
}

resource "aws_dynamodb_table" "encrypted_false" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  server_side_encryption {
    enabled = false
  }
  tags = {
    yor_trace = "c3282017-faa3-442c-b414-73b114496b95"
  }
}

resource "aws_dynamodb_table" "encrypted_no_cmk" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "0dcb916d-a1fb-4caf-9c7f-53cf4a183497"
  }
}
