# fail
resource "aws_backup_vault" "backup" {
  name = "example_backup_vault"
  tags = {
    yor_trace = "58bf2f1b-6e08-42be-a020-85811b5b9536"
  }
}

# pass
resource "aws_backup_vault" "backup_with_kms_key" {
  name        = "example_backup_vault"
  kms_key_arn = aws_kms_key.example.arn
  tags = {
    yor_trace = "07b3a32e-9f21-46e1-8984-a6cf889c4ed6"
  }
}