# pass

resource "aws_iam_user" "pass" {
  name = "tech-user"
  tags = {
    yor_trace = "0b9d5056-1533-49f9-b729-4d1af22a0d80"
  }
}

# fail

resource "aws_iam_user" "fail" {
  name = "human-user"
  tags = {
    yor_trace = "12d6bd72-07b5-4a55-946d-d7f88e8b989c"
  }
}

resource "aws_iam_user_login_profile" "fail" {
  user    = aws_iam_user.fail.name
  pgp_key = "keybase:human-user"
}
