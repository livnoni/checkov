resource "aws_kinesis_video_stream" "pass" {
  name = "terraform-kinesis-video-stream-test"

  data_retention_in_hours = 1
  device_name             = "kinesis-video-device-name"
  kms_key_id              = aws_kms_key.default.id
  tags = {
    yor_trace = "23e0294e-bcb8-4d2d-b672-48e4a74b1807"
  }
}

resource "aws_kinesis_video_stream" "fail" {
  name = "terraform-kinesis-video-stream-test"

  data_retention_in_hours = 1
  device_name             = "kinesis-video-device-name"
  tags = {
    yor_trace = "447ebcea-7419-4a43-a2de-7c6eb1115450"
  }
}