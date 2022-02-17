# pass

resource "aws_s3_bucket" "enabled_via_object" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration = {
    object_lock_enabled = "Enabled"
  }
  tags = {
    yor_trace = "48b3f9cb-4100-4197-a1f7-8c3390ca3a7d"
  }
}

resource "aws_s3_bucket" "enabled_via_block" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
  tags = {
    yor_trace = "4c530ce7-e016-4c98-8360-545d2a822f72"
  }
}

# failure

resource "aws_s3_bucket" "disabled_via_object" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration = {
    object_lock_enabled = "Disabled"
  }
  tags = {
    yor_trace = "dd6e1d1b-ae32-4cf7-9fbf-17f94d1b2fe4"
  }
}

resource "aws_s3_bucket" "disabled_via_block" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration {
    object_lock_enabled = "Disabled"
  }
  tags = {
    yor_trace = "28bc6511-5ce4-49fc-9bec-0d79d9ccefd4"
  }
}

# unknown

resource "aws_s3_bucket" "default" {
  bucket = "test-bucket"
  acl    = "private"
  tags = {
    yor_trace = "a42c6742-ca56-445c-93bc-412175b73216"
  }
}
