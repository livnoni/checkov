resource "aws_iam_group_membership" "ok_group" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user_good.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "test-group"
}

resource "aws_iam_user" "user_good" {
  name = "test-user"
  tags = {
    yor_trace = "5e26783f-6ab9-4e28-b339-1545ab9ecd51"
  }
}

resource "aws_iam_user" "user_bad" {
  name = "test-user-two"
  tags = {
    yor_trace = "bc049f72-80fd-4b3b-bcd6-08d37654cc9a"
  }
}


resource "aws_iam_group_membership" "bad_group" {
  name  = "tf-testing-group-membership"
  users = []
  group = aws_iam_group.bad_group.name
}

resource "aws_iam_group" "bad_group" {
  name = "test-group"
}