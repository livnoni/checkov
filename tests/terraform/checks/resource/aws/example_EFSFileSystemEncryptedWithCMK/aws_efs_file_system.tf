resource "aws_efs_file_system" "pass" {
  encrypted  = true
  kms_key_id = aws_kms_key.test.arn
  tags = {
    yor_trace = "f354f798-9678-4269-967f-60b870619b01"
  }
}

resource "aws_efs_file_system" "fail" {
  encrypted = true
  tags = {
    yor_trace = "e7305ebe-a004-4fd5-a04e-939efecab413"
  }
}