# pass

resource "aws_eks_cluster" "disabled" {
  name     = "example"
  role_arn = "aws_iam_role.arn"

  vpc_config {
    subnet_ids = ["subnet-12345"]

    endpoint_public_access = False
  }
  tags = {
    yor_trace = "fe246162-b28d-4b06-8d47-2c58ebf31454"
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
    yor_trace = "3aab87ea-6c99-466b-abae-4a6a2df822e7"
  }
}

resource "aws_eks_cluster" "enabled" {
  name     = "example"
  role_arn = "aws_iam_role.arn"

  vpc_config {
    subnet_ids = ["subnet-12345"]

    endpoint_public_access = True
  }
  tags = {
    yor_trace = "9f0818a0-6d1d-4c2d-972a-00cd2a2cb9b5"
  }
}
