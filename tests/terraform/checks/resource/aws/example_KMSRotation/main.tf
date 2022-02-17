resource "aws_kms_key" "pass1" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags = {
    yor_trace = "f45d59c4-d0eb-461d-8cb6-8cef86f635ac"
  }
}

resource "aws_kms_key" "pass2" {
  description              = "KMS key 1"
  deletion_window_in_days  = 10
  customer_master_key_spec = "RSA_2096"
  tags = {
    yor_trace = "81aaad1e-dcef-4f73-ba3b-348733919e7c"
  }
}

resource "aws_kms_key" "pass3" {
  description              = "KMS key 1"
  deletion_window_in_days  = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  enable_key_rotation      = true
  tags = {
    yor_trace = "cb85d40e-457c-4817-a99f-ba09f1227d9a"
  }
}

resource "aws_kms_key" "fail1" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  tags = {
    yor_trace = "d3483468-7d20-4cb5-a0ae-27a715810642"
  }
}

resource "aws_kms_key" "fail2" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  enable_key_rotation     = false
  tags = {
    yor_trace = "6e8a0c34-1c7f-4ef3-af26-14ba3338a184"
  }
}

resource "aws_kms_key" "fail3" {
  description              = "KMS key 1"
  deletion_window_in_days  = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  enable_key_rotation      = false
  tags = {
    yor_trace = "57a64b11-b8f8-4523-9e92-a9c78df683af"
  }
}

resource "aws_kms_key" "fail4" {
  description              = "KMS key 1"
  deletion_window_in_days  = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  tags = {
    yor_trace = "63c85a92-282f-4ecf-9d3d-d092bb0c7933"
  }
}