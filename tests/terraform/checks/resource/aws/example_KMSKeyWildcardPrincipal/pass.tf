resource "aws_kms_key" "pass_0" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::111122223333:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "30de83de-2ecb-42bc-a06c-c4cefb3d7c42"
  }
}

resource "aws_kms_key" "pass_1" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": {
        "AWS": "*"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "0a7a992c-c831-44f0-a2b7-966803f4cbcb"
  }
}

resource "aws_kms_key" "pass_2" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "foo",
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "35e5cd6f-ff60-4a4a-b35b-9c15b4de45c0"
  }
}

resource "aws_kms_key" "pass_3" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","bar"],
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "9fc09bda-a765-44eb-991c-d1c918e6b096"
  }
}
