resource "aws_iam_group_membership" "ok_group" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user_one.name,
    aws_iam_user.user_two.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "test-group"
}

resource "aws_iam_user" "user_one" {
  name = "test-user"
  tags = {
    yor_trace = "3858757b-3706-42f7-b6d5-2aa6d0f14e40"
  }
}

resource "aws_iam_user" "user_two" {
  name = "test-user-two"
  tags = {
    yor_trace = "63fe52ec-3d72-47fd-93c0-4471be054625"
  }
}


resource "aws_iam_group_membership" "bad_group" {
  name = "tf-testing-group-membership"


  group = aws_iam_group.bad_group.name
}


resource "aws_iam_group" "bad_group" {
  name = "test-group"
}