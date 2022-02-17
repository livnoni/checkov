resource "aws_instance" "some_instance" {
  ami           = "some_ami"
  instance_type = "t3.nano"
  tags = {
    Name      = "acme-machine"
    yor_trace = "77371a9f-9575-4d44-848e-0a38bae36449"
  }
}

resource "aws_subnet" "acme_subnet" {
  cidr_block = ""
  vpc_id     = ""

  tags = {
    acme      = "true"
    Name      = "notacme-subnet"
    yor_trace = "f58df1e4-da87-4b09-899d-b86e75f3a46a"
  }
}

resource "aws_s3_bucket" "acme_s3_bucket" {
  bucket = "acme-123456"
  tags = {
    Environment = "dev"
    yor_trace   = "d10c9438-4d9d-4e35-a6a1-c6dbe45533a3"
  }
}