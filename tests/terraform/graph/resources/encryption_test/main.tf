resource "aws_rds_cluster" "rds_cluster_encrypted" {
  cluster_identifier = "some-encrypted-id"
  kms_key_id         = "some-kms-key-id"
  tags = {
    yor_trace = "7996cd3b-0464-4c30-a9e7-45338c145c88"
  }
}

resource "aws_rds_cluster" "rds_cluster_unencrypted" {
  cluster_identifier = "some-unencrypted-id"
  tags = {
    yor_trace = "7159fff8-000e-4918-81f4-10481ebe00b9"
  }
}

resource "aws_s3_bucket" "encrypted_bucket" {
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    yor_trace = "cc6e9997-c652-48bb-8845-ab9d17082633"
  }
}

resource "aws_s3_bucket" "unencrypted_bucket" {
  versioning {
    enabled = True
  }
  tags = {
    yor_trace = "c225cb21-e3f6-4e33-a7e9-1954dbc5bebe"
  }
}

resource "aws_neptune_cluster" "encrypted_neptune" {
  cluster_identifier = "encrypted-neptune"
  storage_encrypted  = true
  tags = {
    yor_trace = "16eceac1-4d2a-4b25-abd7-c99ae59cf671"
  }
}

resource "aws_neptune_cluster" "unencrypted_neptune" {
  cluster_identifier = "unencrypted-neptune"
  tags = {
    yor_trace = "865fcaa6-4fff-4a32-a672-7cb2642cd625"
  }
}
