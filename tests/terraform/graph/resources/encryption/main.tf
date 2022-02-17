# Resource names in this file are **important**
# Encrypted resources _must_ start their name with the word "encrypted"
resource aws_ecr_repository "encrypted_repo" {
  name = "nimtest-repo"
  encryption_configuration {
    encryption_type = "AES256"
  }
  tags = {
    yor_trace = "e739463a-9022-4063-a8d8-a397cf397028"
  }
}

resource aws_ecr_repository "unencrypted_repo" {
  name = "nimtest-repo-unencrypted"
  tags = {
    yor_trace = "0adaf204-6e26-420c-bb0f-07d2e735d7e7"
  }
}

resource "aws_neptune_cluster" "encrypted_neptune" {
  storage_encrypted   = true
  skip_final_snapshot = true
  tags = {
    yor_trace = "535809ac-3948-471e-8b3b-e65def66e335"
  }
}

resource "aws_neptune_cluster" "unencrypted_neptune" {
  storage_encrypted   = false
  skip_final_snapshot = true
  tags = {
    yor_trace = "0a0373c6-6fe2-45ad-86fa-f61f80d91a48"
  }
}

resource "aws_efs_file_system" "encrypted_file_system" {
  encrypted = true
  tags = {
    yor_trace = "e61eee58-62cc-477f-86cb-23f1edcc97d5"
  }
}

resource "aws_efs_file_system" "unencrypted_file_system" {
  tags = {
    yor_trace = "2caab32c-8571-4a46-ab7a-983c576e9f01"
  }
}

resource "aws_ebs_volume" "encrypted_volume" {
  availability_zone = "us-east-1a"
  encrypted         = true
  size              = 8
  tags = {
    yor_trace = "94b0a07e-7134-4086-9ab5-2eaaf1647f21"
  }
}

resource "aws_ebs_volume" "unencrypted_volume" {
  availability_zone = "us-east-1a"
  size              = 8
  tags = {
    yor_trace = "20ff9850-545e-4c74-86da-6d1f1b7be6e6"
  }
}

resource "aws_ebs_volume" "unencrypted_volume2" {
  availability_zone = "us-east-1a"
  encrypted         = false
  size              = 8
  tags = {
    yor_trace = "27378b5a-2c3f-48e0-afc0-10baece8855b"
  }
}

resource "aws_elasticache_replication_group" "encrypted_replication_group" {
  replication_group_description = "nimtest replication group"
  replication_group_id          = "nimtest"
  at_rest_encryption_enabled    = true
  cluster_mode {
    num_node_groups         = 0
    replicas_per_node_group = 0
  }
  tags = {
    yor_trace = "560247af-b987-40cb-a4ee-1d73298d1b8a"
  }
}

resource "aws_elasticache_replication_group" "unencrypted_replication_group" {
  replication_group_description = "nimtest replication group"
  replication_group_id          = "nimtest"
  cluster_mode {
    num_node_groups         = 0
    replicas_per_node_group = 0
  }
  tags = {
    yor_trace = "6e8f0036-04dc-4de0-8cd5-503e8ae12774"
  }
}

resource "aws_elasticsearch_domain" "encrypted_domain" {
  domain_name = "nimtest-encryption-test"
  encrypt_at_rest {
    enabled = true
  }
  node_to_node_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "8f0ca3b2-cce6-4f01-80e9-a399a16dfbf6"
  }
}

resource "aws_elasticsearch_domain" "unencrypted_domain" {
  domain_name = "nimtest-encryption-test"
  node_to_node_encryption {
    enabled = false
  }
  tags = {
    yor_trace = "9602e87c-01dd-494f-a287-2fa41a489a14"
  }
}

resource "aws_msk_cluster" "encrypted_msk" {
  cluster_name           = ""
  kafka_version          = ""
  number_of_broker_nodes = 0
  broker_node_group_info {
    client_subnets  = []
    ebs_volume_size = 0
    instance_type   = ""
    security_groups = []
  }

  encryption_info {
    encryption_in_transit {
      in_cluster    = true
      client_broker = "TLS"
    }
    encryption_at_rest_kms_key_arn = "KMS"
  }
  tags = {
    yor_trace = "1645de4c-8536-4734-89d6-4140c2ed08a1"
  }
}

resource "aws_kinesis_stream" "encrypted_stream" {
  name            = "nimtest"
  shard_count     = 1
  encryption_type = "KMS"
  kms_key_id      = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "aa7c5512-abe9-4e58-bdd5-0109903d1ff2"
  }
}

resource "aws_kinesis_stream" "unencrypted_stream" {
  name        = "nimtest"
  shard_count = 1
  tags = {
    yor_trace = "f87afd90-0d4d-4d4e-b704-513ae123a94b"
  }
}

resource "aws_s3_bucket" "unencrypted_bucket" {
  bucket = "unencrypted"
  tags = {
    yor_trace = "b09b691f-0ecf-4ecc-8ff9-db1cf1020d36"
  }
}

resource "aws_s3_bucket" "encrypted_bucket" {
  bucket = "unencrypted"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
  tags = {
    yor_trace = "eecc25f1-79c4-4f26-97ea-09beb179fb8b"
  }
}

resource "aws_s3_bucket" "encrypted_bucket_2" {
  bucket = "unencrypted"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    yor_trace = "4dbbe471-7b49-4a75-b0dc-3be768df401d"
  }
}

resource "aws_s3_bucket_object" "encrypted_object_by_itself" {
  bucket = aws_s3_bucket.encrypted_bucket.bucket
  key    = "some-key.html"

  server_side_encryption = "AES256"
  tags = {
    yor_trace = "25eb7f68-da1b-4d44-8088-379dfb3341ed"
  }
}

resource "aws_s3_bucket_object" "unencrypted_object_by_bucket" {
  bucket = aws_s3_bucket.encrypted_bucket.bucket
  key    = "some-key.html"
  tags = {
    yor_trace = "3359cc82-b341-4c43-a871-3585fb0cce8e"
  }
}

resource "aws_sns_topic" "encrypted_topic" {
  name              = "encrypted"
  kms_master_key_id = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "87ccbab0-0663-42b0-9015-562f2b17ee62"
  }
}

resource "aws_sns_topic" "unencrypted_topic" {
  name = "unencrypted"
  tags = {
    yor_trace = "6694a33c-9554-46be-a841-97c11de23fd2"
  }
}

resource "aws_sqs_queue" "encrypted_queue" {
  name              = "encrypted"
  kms_master_key_id = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "800b8ec8-a09f-4dfa-b823-3f993fe6765a"
  }
}

resource "aws_sqs_queue" "unencrypted_queue" {
  name = "unencrypted"
  tags = {
    yor_trace = "bd05808d-965f-495d-b0bd-5348f7899e77"
  }
}

resource "aws_cloudwatch_log_group" "encrypted_by_default_cloudwatch_log_group" {
  name = "group"
  tags = {
    yor_trace = "c255744e-3966-454a-a196-d94d476f96a9"
  }
}

resource "aws_cloudwatch_log_group" "encrypted" {
  name       = "group"
  kms_key_id = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "72613876-5d83-4c23-bcd2-76bf309b664f"
  }
}

resource "aws_cloudtrail" "encrypted" {
  name           = "encrypted"
  s3_bucket_name = aws_s3_bucket.encrypted_bucket.bucket
  kms_key_id     = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "a80d5a49-22ad-4216-9e87-136df6b24d41"
  }
}

resource "aws_cloudtrail" "unencrypted" {
  name           = "encrypted"
  s3_bucket_name = aws_s3_bucket.encrypted_bucket.bucket
  tags = {
    yor_trace = "4bc5a6f6-d65b-47a0-b047-2ad3f5a387d9"
  }
}

resource "aws_dynamodb_table" "encrypted" {
  name     = "encrypted"
  hash_key = ""
  attribute {
    name = ""
    type = ""
  }
  server_side_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "6ef3d675-6e1e-4d97-873e-2c98a309e01d"
  }
}

resource "aws_dynamodb_table" "encrypted_by_default_dynamodb_table" {
  name     = "encrypted_by_default"
  hash_key = ""
  attribute {
    name = ""
    type = ""
  }
  tags = {
    yor_trace = "2c9b7658-7856-44e2-8baf-48806444b922"
  }
}

resource "aws_iam_role" "role" {
  assume_role_policy = ""
  tags = {
    yor_trace = "a1422139-f8a3-42a7-8c85-0d3ff79f6868"
  }
}

resource "aws_docdb_cluster" "encrypted_docdb" {
  storage_encrypted = true
  kms_key_id        = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "06c3ce33-780d-4236-8a56-57b724f42c2f"
  }
}

resource "aws_docdb_cluster" "unencrypted_docdb" {
  storage_encrypted = false
  tags = {
    yor_trace = "aa2d1d28-5998-4650-ae7c-e617f901a53d"
  }
}

resource "aws_codebuild_project" "encrypted_project" {
  name         = "encrypted"
  service_role = ""
  artifacts {
    type = ""
  }
  environment {
    compute_type = ""
    image        = ""
    type         = ""
  }
  source {
    type = ""
  }

  encryption_key = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "0168df62-e008-4d5e-816b-e7b63eb05493"
  }
}

resource "aws_codebuild_project" "unencrypted_project" {
  name         = "unencrypted"
  service_role = ""
  artifacts {
    type = ""
  }
  environment {
    compute_type = ""
    image        = ""
    type         = ""
  }
  source {
    type = ""
  }
  tags = {
    yor_trace = "0c271a28-fef1-465d-b78e-1891ed1264f1"
  }
}

resource "aws_codebuild_report_group" "encrypted_report_group" {
  export_config {
    type = "S3"
    s3_destination {
      bucket              = "some-bucket"
      encryption_disabled = false
      encryption_key      = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
      packaging           = "NONE"
      path                = "/some/path"
    }
  }
  tags = {
    yor_trace = "67976ac3-b42c-4f9d-b8bc-a3e4a80f4acd"
  }
}

resource "aws_codebuild_report_group" "unencrypted_report_group" {
  export_config {
    type = "S3"
    s3_destination {
      bucket              = "some-bucket"
      encryption_disabled = true
      packaging           = "NONE"
      path                = "/some/path"
    }
  }
  tags = {
    yor_trace = "a6ba6453-ee69-4a89-9a2f-703a2c968068"
  }
}

resource "aws_athena_database" "encrypted_athena_database" {
  bucket = ""
  name   = "encrypted"
  encryption_configuration {
    encryption_option = "SSE_S3"
  }
}

resource "aws_athena_database" "unencrypted_athena_database" {
  bucket = ""
  name   = "unencrypted"
}

resource "aws_athena_workgroup" "encrypted_workgroup" {
  name = "encrypted"
  configuration {
    result_configuration {
      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
      }
    }
  }
  tags = {
    yor_trace = "44832aa2-23a6-4837-b21b-d2879a4d2ed7"
  }
}

resource "aws_athena_workgroup" "unencrypted_workgroup" {
  name = "unencrypted"
  tags = {
    yor_trace = "50be69a6-aeb1-4383-a882-a4fab686cf3c"
  }
}

resource "aws_eks_cluster" "encrypted_eks" {
  name     = ""
  role_arn = ""
  vpc_config {
    subnet_ids = []
  }

  encryption_config {
    resources = []
    provider {
      key_arn = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
    }
  }
  tags = {
    yor_trace = "fd707c45-ef2a-4d17-83e4-c14e9e7e6fde"
  }
}

resource "aws_db_instance" "encrypted_instance" {
  instance_class = ""

  storage_encrypted = true
  tags = {
    yor_trace = "752608d4-8ba7-4bdb-9aa4-905c3f50e237"
  }
}

resource "aws_db_instance" "unencrypted_instance" {
  instance_class = ""

  storage_encrypted = false
  tags = {
    yor_trace = "423c6758-1838-4041-a2ee-e7ba5d4ff1fb"
  }
}

resource "aws_rds_cluster" "encrypted_rds_cluster" {
  storage_encrypted = true
  kms_key_id        = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "1eb2b281-b08f-428d-9f31-2008a94b2d98"
  }
}

resource "aws_rds_cluster" "unencrypted_rds_cluster" {
  tags = {
    yor_trace = "de62f1a7-346a-48e6-a4b4-a99549e0c722"
  }
}

resource "aws_rds_global_cluster" "encrypted_global_rds" {
  global_cluster_identifier = "some-id"
  storage_encrypted         = true
}

resource "aws_rds_global_cluster" "unencrypted_global_rds" {
  global_cluster_identifier = "some-id"
  storage_encrypted         = false
}

resource "aws_s3_bucket_inventory" "encrypted_s3_inventory" {
  bucket                   = ""
  included_object_versions = ""
  name                     = ""
  destination {
    bucket {
      bucket_arn = ""
      format     = ""
      encryption {
        sse_s3 {}
      }
    }
  }
  schedule {
    frequency = ""
  }
}

resource "aws_dax_cluster" "encrypted_dax_cluster" {
  cluster_name       = "dax"
  iam_role_arn       = ""
  node_type          = ""
  replication_factor = 0
  server_side_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "e24ff26a-156a-42a3-b5d1-23491ed291cf"
  }
}

resource "aws_dax_cluster" "unencrypted_dax_cluster" {
  cluster_name       = "dax"
  iam_role_arn       = ""
  node_type          = ""
  replication_factor = 0
  server_side_encryption {
    enabled = false
  }
  tags = {
    yor_trace = "155df5d3-966c-45ad-bc17-875e39991854"
  }
}

resource "aws_redshift_cluster" "encrypted_redshift_cluster" {
  cluster_identifier = "redshift"
  node_type          = ""
  encrypted          = true
  tags = {
    yor_trace = "07586a3a-705a-436e-b9c9-ee997282d1f4"
  }
}

resource "aws_redshift_cluster" "unencrypted_redshift_cluster" {
  cluster_identifier = "redshift"
  node_type          = ""
  tags = {
    yor_trace = "42978d0a-c98d-4109-a648-f945af88334c"
  }
}
