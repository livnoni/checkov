# pass

resource "aws_dax_cluster" "enabled" {
  cluster_name       = "example"
  iam_role_arn       = "data.aws_iam_role.example.arn"
  node_type          = "dax.r4.large"
  replication_factor = 1

  server_side_encryption {
    enabled = True
  }
  tags = {
    yor_trace = "ea47014b-b26e-4f03-b92d-6ada07fc0388"
  }
}

# fail

resource "aws_dax_cluster" "default" {
  cluster_name       = "example"
  iam_role_arn       = "data.aws_iam_role.example.arn"
  node_type          = "dax.r4.large"
  replication_factor = 1
  tags = {
    yor_trace = "0618859e-77b2-4904-9af5-105105112e28"
  }
}

resource "aws_dax_cluster" "disabled" {
  cluster_name       = "example"
  iam_role_arn       = "data.aws_iam_role.example.arn"
  node_type          = "dax.r4.large"
  replication_factor = 1

  server_side_encryption {
    enabled = False
  }
  tags = {
    yor_trace = "b8ffc002-25ce-48e9-adae-ce89b5236031"
  }
}
