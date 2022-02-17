resource "aws_guardduty_detector" "ok" {
  enable = true
  tags = {
    yor_trace = "81cd969b-527a-4351-b7a5-a729dbde477f"
  }
}

resource "aws_guardduty_detector" "not_ok" {
  enable = true
  tags = {
    yor_trace = "52935854-b661-4d37-9ad3-8d3323ff81d9"
  }
}

resource "aws_guardduty_organization_configuration" "example" {
  auto_enable = true
  detector_id = aws_guardduty_detector.ok.id
}

resource "aws_guardduty_detector" "not_ok_false" {
  enable = true
  tags = {
    yor_trace = "f55963cc-8396-4d7e-9f63-ddd44a42c2e6"
  }
}

resource "aws_guardduty_organization_configuration" "example" {
  auto_enable = false
  detector_id = aws_guardduty_detector.not_ok_false.id
}