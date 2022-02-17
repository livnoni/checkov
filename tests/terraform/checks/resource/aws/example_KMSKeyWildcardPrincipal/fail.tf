resource "aws_kms_key" "fail_0" {
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
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "kms:*",
      "Resource": "*"
    },   
  ]
}
POLICY  
  tags = {
    yor_trace = "6f2e5f6e-2b96-4b6b-a512-3a2cff1c74e0"
  }
}

resource "aws_kms_key" "fail_1" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","*"],
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "560067cf-c83d-4254-903c-5ff0d4803e5e"
  }
}

resource "aws_kms_key" "fail_2" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "4c2a3ef4-b009-431c-919d-c46f1ea41425"
  }
}

resource "aws_kms_key" "fail_3" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","*"],
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "9fc2e0c2-b2c1-4006-bc24-1121622f2fc8"
  }
}

resource "aws_kms_key" "fail_4" {
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
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [ 
          "arn:aws:iam::111122223333:root",
          "*"
        ]
      },
      "Action": "kms:*",
      "Resource": "*"
    }   
  ]
}
POLICY  
  tags = {
    yor_trace = "8e3a635b-7779-4f2f-8009-f69b275f712d"
  }
}
