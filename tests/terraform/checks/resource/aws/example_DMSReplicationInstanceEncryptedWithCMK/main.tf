resource "aws_dms_replication_instance" "pass" {
  engine_version             = "3.1.4"
  multi_az                   = false
  publicly_accessible        = true
  replication_instance_class = "dms.t2.micro"
  replication_instance_id    = "test-dms-replication-instance-tf"
  kms_key_arn                = aws_kms_key.example.arn
  # auto_minor_version_upgrade=false
  tags = {
    yor_trace = "3fe507f7-8f25-4d64-9022-eb33074b6522"
  }
}


resource "aws_dms_replication_instance" "fail" {
  engine_version             = "3.1.4"
  multi_az                   = false
  publicly_accessible        = true
  replication_instance_class = "dms.t2.micro"
  replication_instance_id    = "test-dms-replication-instance-tf"
  # kms_key_arn = ""
  # auto_minor_version_upgrade=false
  tags = {
    yor_trace = "023fb2cf-aa2d-4edd-9569-a03f1d41ff22"
  }
}