resource "aws_kinesis_stream" "pass" {
  name            = "test_stream-%[1]d"
  shard_count     = 1
  encryption_type = "KMS"
  kms_key_id      = aws_kms_key.sse_aws_kms_key_id.id
  tags = {
    yor_trace = "cd45c52e-4306-4876-83a9-cdfbaf7eb2e9"
  }
}

resource "aws_kinesis_stream" "fail" {
  name            = "test_stream-%[1]d"
  shard_count     = 1
  encryption_type = "KMS"
  tags = {
    yor_trace = "76cf9b4b-858e-4cb0-b6ae-8b5bdd1e1ed4"
  }
}