resource "aws_iam_role" "fail" {
  name               = "fail-default"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": { "AWS": "123123123123" },
      "Effect": "Allow",
      "Sid": ""
    }]
}
POLICY
  tags = {
    yor_trace = "f2dee66a-d5cf-4786-b31a-b7e19cc82792"
  }
}

resource "aws_iam_role" "fail2" {
  name               = "fail-default"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [{
    "Action": "sts:AssumeRole",
    "Principal": {"AWS": "arn:aws:iam::123123123123:root"},
    "Effect": "Allow",
    "Sid": ""
  }]
}
POLICY
  tags = {
    yor_trace = "24e8b8d0-446e-40af-a22d-f99d9bae7dc8"
  }
}


resource "aws_iam_role" "pass2" {
  name               = "pass2-default"
  assume_role_policy = ""
  tags = {
    yor_trace = "86137d57-c230-4853-8e68-cc3ff89976e4"
  }
}

resource "aws_iam_role" "pass" {
  name = "pass-default"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [{
    "Action": "sts:AssumeRole",
    "Principal": { "Service": "ecs-tasks.amazonaws.com"    },
    "Effect": "Allow",
    "Sid": ""
  }]
}
POLICY
  tags = {
    yor_trace = "d02f0cd4-ea3d-4fc8-ac1c-fc063a200455"
  }
}

