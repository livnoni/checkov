# pass
resource "aws_s3_bucket" "passed_bucket" {
  bucket = "passed_bucket"
  acl    = var.private_acl
  tags = {
    yor_trace = "09224d4d-9b24-41d6-9d14-f845c0ad79b8"
  }
}

# fail
resource "aws_s3_bucket" "failed_bucket" {
  bucket = "failed_bucket"
  acl    = var.public_read_write_acl
  tags = {
    yor_trace = "8cfe5903-c3eb-4fe8-b1d8-1a3c3355573a"
  }
}

### variables not in scope or dont exist ###

resource "aws_s3_bucket" "unknown_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = var.var_doesnt_exist
  tags = {
    yor_trace = "e77c29cf-1239-4395-9982-359b6f1551c5"
  }
}

resource "aws_s3_bucket" "unknown_acl_bucket_2" {
  bucket = "unknown_acl_bucket_2"
  acl    = var.unscoped_private_acl
  tags = {
    yor_trace = "d43f5bba-c51f-48ec-9a95-0de140d471a3"
  }
}

resource "aws_s3_bucket" "unknown_acl_bucket_3" {
  bucket = "unknown_acl_bucket_3"
  acl    = var.unscoped_public_read_write_acl
  tags = {
    yor_trace = "918ccb95-8f58-4972-9956-52a7201c712f"
  }
}

resource "aws_s3_bucket" "unknown_acl_bucket_4" {
  bucket = "unknown_acl_bucket_4"
  acl    = local.unscoped_private_acl
  tags = {
    yor_trace = "2fdd84ef-19b6-4868-8646-6395d147ee34"
  }
}

resource "aws_s3_bucket" "unknown_acl_bucket_5" {
  bucket = "unknown_acl_bucket_5"
  acl    = local.unscoped_public_read_write_acl
  tags = {
    yor_trace = "46554cb5-f89e-4aee-987a-67da3b4213a3"
  }
}

resource "aws_s3_bucket" "unknown_data_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = data.doesnt_exist
  tags = {
    yor_trace = "0d46bc1d-e30a-4e43-8ea7-a3d814c143ad"
  }
}

resource "aws_s3_bucket" "unknown_data_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = module.doesnt_exist
  tags = {
    yor_trace = "0d46bc1d-e30a-4e43-8ea7-a3d814c143ad"
  }
}