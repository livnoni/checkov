resource "aws_fsx_lustre_file_system" "pass" {
  storage_capacity            = 1200
  subnet_ids                  = [aws_subnet.test1.id]
  deployment_type             = "PERSISTENT_1"
  per_unit_storage_throughput = 50
  kms_key_id                  = aws_kms_key.test1.arn
  tags = {
    yor_trace = "8b437324-3c39-45b1-a9e6-34eab8efe1d2"
  }
}

resource "aws_fsx_lustre_file_system" "fail" {
  storage_capacity            = 1200
  subnet_ids                  = [aws_subnet.test1.id]
  deployment_type             = "PERSISTENT_1"
  per_unit_storage_throughput = 50
  tags = {
    yor_trace = "4f8ac910-956c-419c-8bc5-2ee727ae459e"
  }
}