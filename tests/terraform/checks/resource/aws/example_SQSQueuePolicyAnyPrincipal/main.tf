# pass
resource "aws_sqs_queue_policy" "q1" {
  queue_url = aws_sqs_queue.q.id

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Principal": "*",
          "Effect": "Deny",
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
}

# fail
resource "aws_sqs_queue_policy" "q2" {
  queue_url = aws_sqs_queue.q.id

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
           "Principal": { 
            "AWS": [
                "arn:aws:iam::123456789101:role/sqs", 
                "*"
            ]
          },
          "Effect": "Allow",
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
}

# fail
resource "aws_sqs_queue_policy" "q3" {
  queue_url = aws_sqs_queue.q.id

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Principal": { 
            "AWS": "arn:aws:iam::*:role/sqs"
          },
          "Effect": "Allow",
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
}

# fail
resource "aws_sqs_queue_policy" "q4" {
  queue_url = aws_sqs_queue.q.id

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
           "Principal": { 
            "AWS": "*"
          },
          "Effect": "Allow",
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
}

# fail
resource "aws_sqs_queue_policy" "q5" {
  queue_url = aws_sqs_queue.q.id

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Principal": "*",
          "Effect": "Allow",
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
}

# pass
resource "aws_sqs_queue_policy" "q6" {
  queue_url = aws_sqs_queue.q.id

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Principal": "arn:aws:iam::123456789101:role/sqs",
          "Effect": "Allow",
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
}

# unknown
resource "aws_sqs_queue_policy" "q7" {
  queue_url = aws_sqs_queue.q.id

  policy = data.aws_iam_policy_document.bucket_policy.json
}


# now test aws_sqs_queue
# pass
resource "aws_sqs_queue" "aq1" {

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Principal": "*",
          "Effect": "Deny",
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
  tags = {
    yor_trace = "154226a6-766e-4256-b8ef-333d8231a09e"
  }
}

# fail
resource "aws_sqs_queue" "aq2" {
  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
           "Principal": {
            "AWS": [
                "arn:aws:iam::123456789101:role/sqs",
                "*"
            ]
          },
          "Effect": "Allow",
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
  tags = {
    yor_trace = "43f5ffaa-5fe1-4d7b-b223-c510916f94a4"
  }
}

# fail
resource "aws_sqs_queue" "aq3" {

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Principal": {
            "AWS": "arn:aws:iam::*:role/sqs"
          },
          "Effect": "Allow",
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
  tags = {
    yor_trace = "2f8704b1-965d-4cc8-94c0-68e438209ef3"
  }
}

# fail
resource "aws_sqs_queue" "aq4" {

  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
           "Principal": {
            "AWS": "*"
          },
          "Effect": "Allow",
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
  tags = {
    yor_trace = "aa1eacad-6627-4269-93e3-ddc63c4cea2f"
  }
}

# fail
resource "aws_sqs_queue" "aq5" {
  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Principal": "*",
          "Effect": "Allow",
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
  tags = {
    yor_trace = "dfda03f9-56d2-4716-8d37-eacc88c5fea3"
  }
}

# pass
resource "aws_sqs_queue" "aq6" {
  policy = <<POLICY
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Principal": "arn:aws:iam::123456789101:role/sqs",
          "Effect": "Allow",
          "Action": "sqs:SendMessage",
          "Resource": "${aws_sqs_queue_policy.q.arn}"
       }
    ]
}
POLICY
  tags = {
    yor_trace = "4ba50f33-2962-4d39-8b6b-04694dd7151f"
  }
}

# unknown
resource "aws_sqs_queue" "aq7" {
  policy = data.aws_iam_policy_document.bucket_policy.json
  tags = {
    yor_trace = "23b5054a-a349-4a64-a0e5-7cd70c528c8d"
  }
}