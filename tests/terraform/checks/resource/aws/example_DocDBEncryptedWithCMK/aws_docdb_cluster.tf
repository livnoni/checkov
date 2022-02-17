resource "aws_docdb_cluster" "fail" {
  cluster_identifier  = "mycluster"
  availability_zones  = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1], data.aws_availability_zones.available.names[2]]
  master_username     = "foo"
  master_password     = "mustbeeightcharaters"
  storage_encrypted   = true
  skip_final_snapshot = true
  tags = {
    yor_trace = "aa25467c-4b83-4275-8189-149a52a17221"
  }
}

resource "aws_docdb_cluster" "pass" {
  cluster_identifier  = "mycluster"
  availability_zones  = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1], data.aws_availability_zones.available.names[2]]
  master_username     = "foo"
  master_password     = "mustbeeightcharaters"
  storage_encrypted   = true
  kms_key_id          = aws_kms_key.foo.arn
  skip_final_snapshot = true
  tags = {
    yor_trace = "c5ba22d8-40f9-420e-9071-f6bead8b21f7"
  }
}