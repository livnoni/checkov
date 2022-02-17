resource "aws_vpc" "ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "a9b48f3d-46a0-441b-92e4-c925ee07eb32"
  }
}

resource "aws_network_acl" "acl_ok_optionA" {
  vpc_id = aws_vpc.ok_vpc.id
  tags = {
    yor_trace = "7acef776-e88d-497a-ad49-5179992157f8"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.ok_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    yor_trace = "25bd8752-72de-4dba-be41-4862b7fd0f96"
  }
}

resource "aws_subnet" "main_optionB" {
  cidr_block = "10.0.1.0/24"
  tags = {
    yor_trace = "abf845b5-d37c-4e2d-994f-95eef0fbeaa8"
  }
}

resource "aws_network_acl" "acl_ok_optionB" {
  vpc_id     = aws_vpc.ok_vpc.id
  subnet_ids = [aws_subnet.main_optionB.id]
  tags = {
    yor_trace = "4d318a45-c78a-4103-99f3-ce080a7cf08c"
  }
}


resource "aws_vpc" "bad_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "d24e7beb-c44f-48ea-ad8d-903994bd27d1"
  }
}


resource "aws_network_acl" "acl_bad_A" {
  vpc_id = aws_vpc.bad_vpc.id
  tags = {
    yor_trace = "64865566-43d3-45f8-8a88-37661900d391"
  }
}

resource "aws_network_acl" "acl_bad_B" {

  tags = {
    yor_trace = "78a9886d-0f28-46e0-880d-f4282fb825c0"
  }
}

resource "aws_vpc" "no_nacl_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "8fafd606-6775-424f-8077-0fddc20c5b3c"
  }
}

