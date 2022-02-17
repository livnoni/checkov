# pass
resource "aws_s3_bucket" "enabled_bucket" {
  bucket = "enabled_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_enabled
  }
  tags = {
    yor_trace = "d0e505ed-be9f-4ed9-b86b-b44be8babd55"
  }
}

# fail
resource "aws_s3_bucket" "disabled_bucket" {
  bucket = "disabled_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_disabled
  }
  tags = {
    yor_trace = "02f26ce2-3887-48ee-8c19-fc063d624b44"
  }
}

### variables not in scope or dont exist ###

resource "aws_s3_bucket" "unknown_var_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_unknown
  }
  tags = {
    yor_trace = "efb64886-6b00-44be-84e8-ec3cf3cf5927"
  }
}

resource "aws_s3_bucket" "unknown_var_2_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_disabled_2
  }
  tags = {
    yor_trace = "17ff20a3-bea3-4de7-b8a2-bec5fa52bffb"
  }
}

resource "aws_s3_bucket" "unknown_local_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = local.versioning_disabled
  }
  tags = {
    yor_trace = "450f8638-2ff3-48fb-bc9b-370c9947f560"
  }
}

resource "aws_s3_bucket" "unknown_enabled_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_enabled_2
  }
  tags = {
    yor_trace = "eb03dae0-271b-4448-a8da-cf7ba6af1ad5"
  }
}

resource "aws_s3_bucket" "unknown_enabled_local_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = local.versioning_enabled
  }
  tags = {
    yor_trace = "5515e037-d8a9-4c93-81f6-459f77fa3b10"
  }
}

resource "aws_s3_bucket" "unknown_data_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = "private"

  versioning {
    enabled = data.doesnt_exist
  }
  tags = {
    yor_trace = "3d570da2-b483-4074-9892-d05e73fa567e"
  }
}

resource "aws_s3_bucket" "unknown_data_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = "private"

  versioning {
    enabled = module.doesnt_exist
  }
  tags = {
    yor_trace = "3d570da2-b483-4074-9892-d05e73fa567e"
  }
}