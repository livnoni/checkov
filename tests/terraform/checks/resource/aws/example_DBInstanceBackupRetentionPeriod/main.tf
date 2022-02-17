resource "aws_rds_cluster" "pass" {
  backup_retention_period = 35
  tags = {
    yor_trace = "4d3a0d1d-3166-48bf-bded-5198c9c8883b"
  }
}

resource "aws_rds_cluster" "pass2" {
  tags = {
    yor_trace = "55902473-46e9-4050-ad7d-ddcbddbdeb5e"
  }
}

resource "aws_rds_cluster" "fail2" {
  backup_retention_period = 0
  tags = {
    yor_trace = "64a99be2-4a41-47d5-b957-fed5badeaed7"
  }
}

#this will fail in tf i dont know why we even bother?
resource "aws_rds_cluster" "fail" {
  backup_retention_period = 36
  tags = {
    yor_trace = "def1348c-448c-491b-aae5-984e110be449"
  }
}

resource "aws_db_instance" "pass" {
  backup_retention_period = 35
  tags = {
    yor_trace = "aa388358-d911-4250-beb6-676209662c3d"
  }
}

resource "aws_db_instance" "pass2" {
  tags = {
    yor_trace = "9a6f2ac0-52b2-4887-98fd-91b91e9f00e9"
  }
}

resource "aws_db_instance" "fail2" {
  backup_retention_period = 0
  tags = {
    yor_trace = "85017501-2489-4776-83ad-653f6102122d"
  }
}

#this will fail in tf i dont know why we even bother?
resource "aws_db_instance" "fail" {
  backup_retention_period = 36
  tags = {
    yor_trace = "cf9310bd-d967-443e-98f4-31f3b3a59690"
  }
}

resource "aws_db_instance" "unknown" {
  backup_retention_period = var.backup_retention_period
  tags = {
    yor_trace = "1924cb2e-e685-40bc-95cc-45f1dc01ff3f"
  }
}
