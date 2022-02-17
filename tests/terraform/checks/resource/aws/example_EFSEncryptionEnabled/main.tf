# pass

resource "aws_efs_file_system" "enabled" {
  creation_token = "example"

  encrypted = true
  tags = {
    yor_trace = "dbfd897e-a203-418e-b704-896e2d4d9eb6"
  }
}

# fail

resource "aws_efs_file_system" "default" {
  creation_token = "example"
  tags = {
    yor_trace = "4058a2c0-2cd5-4c26-b828-a506189000f8"
  }
}

resource "aws_efs_file_system" "disabled" {
  creation_token = "example"

  encrypted = false
  tags = {
    yor_trace = "c281f576-c8d0-4ecf-983f-448294ed4180"
  }
}
