resource "aws_redshift_cluster" "pass" {
  cluster_identifier                  = "examplea"
  availability_zone                   = data.aws_availability_zones.available.names[0]
  database_name                       = "mydb"
  master_username                     = "foo_test"
  master_password                     = "Mustbe8characters"
  node_type                           = "dc2.large"
  automated_snapshot_retention_period = 0
  allow_version_upgrade               = false
  skip_final_snapshot                 = true
  encrypted                           = true
  kms_key_id                          = aws_kms_key.test.arn
  tags = {
    yor_trace = "fe64854a-6511-4799-af76-0bb7fd60ccbe"
  }
}

resource "aws_redshift_cluster" "fail" {
  cluster_identifier                  = "examplea"
  availability_zone                   = data.aws_availability_zones.available.names[0]
  database_name                       = "mydb"
  master_username                     = "foo_test"
  master_password                     = "Mustbe8characters"
  node_type                           = "dc2.large"
  automated_snapshot_retention_period = 0
  allow_version_upgrade               = false
  skip_final_snapshot                 = true
  encrypted                           = true
  tags = {
    yor_trace = "282c59c7-30ee-4494-bc18-02094b945275"
  }
}