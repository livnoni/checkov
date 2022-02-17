
data "aws_iam_policy_document" "restrictions" {

  # do not allow the account to leave the org except for the exempt
  statement {
    effect = "Deny"
    resources = [
      "*",
    ]
  }

}

resource "aws_organizations_policy" "restrictions" {
  name    = "${var.account_name}-restrictions"
  content = data.aws_iam_policy_document.restrictions.json
  tags = {
    yor_trace = "9c97a2b0-75e5-48c5-afa1-88674f22cb11"
  }
}
