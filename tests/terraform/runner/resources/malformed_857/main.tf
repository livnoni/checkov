resource "aws_instance" {
  ami           = "amiid"
  instance_type = "t3.micro"
  tags = {
    yor_trace = "edaf55c6-a580-44fb-96bf-47f313377dee"
  }
}
