# pass
resource "aws_glacier_vault" "my_archive1" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": "*",
          "Effect": "Deny",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "f6dea69a-540c-465f-a40a-8a2c75a41814"
  }
}

# fail
resource "aws_glacier_vault" "my_archive2" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
           "Principal": { 
            "AWS": [
                "arn:aws:iam::123456789101:role/vault-reader", 
                "*"
            ]
          },
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "ffe2fb87-dc35-49ef-a037-1325bd1f89a8"
  }
}

# fail
resource "aws_glacier_vault" "my_archive3" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": { 
            "AWS": "arn:aws:iam::*:role/vault-reader"
          },
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "cb14248f-2fde-4dca-93d4-bcf18b9310c4"
  }
}

# fail
resource "aws_glacier_vault" "my_archive4" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
           "Principal": { 
            "AWS": "*"
          },
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "471af77b-ac81-4562-8352-16ea9cec754e"
  }
}

# fail
resource "aws_glacier_vault" "my_archive5" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": "*",
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "2da1ac0e-ad02-4aad-92ed-f93bbdf27368"
  }
}

# pass
resource "aws_glacier_vault" "my_archive6" {
  name = "MyArchive"

  access_policy = <<EOF
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Sid": "add-read-only-perm",
          "Principal": "arn:aws:iam::123456789101:role/vault-reader",
          "Effect": "Allow",
          "Action": [
             "glacier:InitiateJob",
             "glacier:GetJobOutput"
          ],
          "Resource": "arn:aws:glacier:eu-west-1:432981146916:vaults/MyArchive"
       }
    ]
}
EOF
  tags = {
    yor_trace = "24daba70-33c7-41ce-bd48-9366ab3a5f10"
  }
}