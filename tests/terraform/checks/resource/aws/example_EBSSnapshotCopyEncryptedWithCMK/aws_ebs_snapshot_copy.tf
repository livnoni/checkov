resource "aws_ebs_snapshot_copy" "pass" {
  source_snapshot_id = aws_ebs_snapshot.test.id
  source_region      = data.aws_region.current.name
  encrypted          = true
  kms_key_id         = aws_kms_key.test.arn

  tags = {
    Name      = "testAccEBSSnapshotCopyWithKMSConfig"
    yor_trace = "ad10da36-96eb-48b1-b5ed-48eace20c331"
  }
}

resource "aws_ebs_snapshot_copy" "fail" {
  source_snapshot_id = aws_ebs_snapshot.test.id
  source_region      = data.aws_region.current.name
  encrypted          = true

  tags = {
    Name      = "testAccEBSSnapshotCopyWithKMSConfig"
    yor_trace = "706f74ed-dda8-4f06-8137-c1a81d55df1d"
  }
}
