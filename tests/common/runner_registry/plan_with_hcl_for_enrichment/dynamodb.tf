resource "aws_dynamodb_table" "cross-environment-violations" {
  # checkov:skip=CKV_AWS_28: ignoring backups for now
  name           = "CrossEnvironmentViolations"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "id"
  attribute {
    name = "id"
    type = "S"
  }
  provider = aws.current_region
  tags = {
    yor_trace = "fca5ad6e-cbef-43d1-ab91-86241b07b48f"
  }
}