# fail
resource "aws_transfer_server" "example_public" {
  endpoint_type = "PUBLIC"
  protocols     = ["SFTP"]
  tags = {
    yor_trace = "b516d3ac-b0cb-437d-9a46-c3d00df64ab3"
  }
}

# pass
resource "aws_transfer_server" "example_vpc" {
  endpoint_type = "VPC"
  protocols     = ["SFTP"]
  tags = {
    yor_trace = "6ce73802-3d45-4bf8-a9e0-50ab36a8c0f7"
  }
}

# fail
resource "aws_transfer_server" "example" {
  protocols = ["SFTP"]
  tags = {
    yor_trace = "e29d8374-1780-47e4-af02-fb890895a98a"
  }
}