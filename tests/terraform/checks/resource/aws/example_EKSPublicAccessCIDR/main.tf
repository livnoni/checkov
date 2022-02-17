# pass

resource "aws_eks_cluster" "disabled" {
  name     = "example"
  role_arn = "aws_iam_role.arn"

  vpc_config {
    subnet_ids = ["subnet-12345"]

    endpoint_public_access = False
  }
  tags = {
    yor_trace = "8b700271-89d0-489b-a462-0cc4d4ee97a6"
  }
}

resource "aws_eks_cluster" "restricted" {
  name     = "example"
  role_arn = "aws_iam_role.arn"

  vpc_config {
    subnet_ids = ["subnet-12345"]

    public_access_cidrs = ["10.0.0.0/16"]
  }
  tags = {
    yor_trace = "8f3a1b80-cf0e-41ad-8a76-c253f67e4582"
  }
}

# fail

resource "aws_eks_cluster" "default" {
  name     = "example"
  role_arn = "aws_iam_role.arn"

  vpc_config {
    subnet_ids = ["subnet-12345"]
  }
  tags = {
    yor_trace = "5830a95d-c78e-42c3-a89c-034ad318f4e4"
  }
}

resource "aws_eks_cluster" "empty" {
  name     = "example"
  role_arn = "aws_iam_role.arn"

  vpc_config {
    subnet_ids = ["subnet-12345"]

    public_access_cidrs = []
  }
  tags = {
    yor_trace = "93ca9ec7-36fc-4ecd-b7bd-377f109a73e9"
  }
}

resource "aws_eks_cluster" "open" {
  name     = "example"
  role_arn = "aws_iam_role.arn"

  vpc_config {
    subnet_ids = ["subnet-12345"]

    public_access_cidrs = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "45758a97-9bdb-4432-ae41-e9610e7f5248"
  }
}
