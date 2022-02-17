# pass

resource "aws_sns_topic" "enabled" {
  name = "example"

  kms_master_key_id = "aws_kms_key.arn"
  tags = {
    yor_trace = "e414d4a2-93ef-47ab-af1e-941b6163a454"
  }
}

# fail

resource "aws_sns_topic" "default" {
  name = "example"
  tags = {
    yor_trace = "823eddbd-ca37-4620-ba6a-bda548b52cec"
  }
}
