# pass

resource "aws_kinesis_stream" "enabled" {
  name        = "example"
  shard_count = 1

  encryption_type = "KMS"
  tags = {
    yor_trace = "0eddea84-fc94-440e-970a-6093045eba72"
  }
}

# fail

resource "aws_kinesis_stream" "default" {
  name        = "example"
  shard_count = 1
  tags = {
    yor_trace = "d295912d-c368-48cd-a58a-2d55f3b151b6"
  }
}

resource "aws_kinesis_stream" "disabled" {
  name        = "example"
  shard_count = 1

  encryption_type = "NONE"
  tags = {
    yor_trace = "e74c372a-bd7a-41f3-84f1-431c00363cb4"
  }
}
