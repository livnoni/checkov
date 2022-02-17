resource "aws_redshift_cluster" "fail" {
  cluster_identifier  = "redshift-defaults-only"
  node_type           = "dc2.large"
  master_password     = "Test1234"
  master_username     = "test"
  skip_final_snapshot = true
  tags = {
    yor_trace = "0a7e8a42-a414-48a4-80b8-01fb4504601a"
  }
}

resource "aws_redshift_cluster" "pass" {
  cluster_identifier        = "redshift-defaults-only"
  node_type                 = "dc2.large"
  master_password           = "Test1234"
  master_username           = "test"
  skip_final_snapshot       = true
  cluster_subnet_group_name = "subnet-ebd9cead"
  tags = {
    yor_trace = "3f2176f8-6e77-44bd-92bf-3c03a9b987cb"
  }
}
