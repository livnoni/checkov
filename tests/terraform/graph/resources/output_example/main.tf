module "submodule" {
  source = "submodule"
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = module.submodule.vpc_id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name      = "tf-example"
    yor_trace = "12e9313f-592e-4e93-958d-9580c966fafe"
  }
}