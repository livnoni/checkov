resource "aws_fsx_windows_file_system" "pass" {
  active_directory_id = aws_directory_service_directory.test.id
  kms_key_id          = aws_kms_key.test1.arn
  skip_final_backup   = true
  storage_capacity    = 32
  subnet_ids          = [aws_subnet.test1.id]
  throughput_capacity = 8
  tags = {
    yor_trace = "00fa98b2-69e6-420d-8950-d955204e5228"
  }
}

resource "aws_fsx_windows_file_system" "fail" {
  active_directory_id = aws_directory_service_directory.test.id
  skip_final_backup   = true
  storage_capacity    = 32
  subnet_ids          = [aws_subnet.test1.id]
  throughput_capacity = 8
  tags = {
    yor_trace = "56257390-a3fd-47c5-8bec-b8af02127b54"
  }
}