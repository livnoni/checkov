resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name      = "tf-example"
    yor_trace = "3e5c048f-a21c-4cbe-90c1-11ddbd37da74"
  }
}