
resource "aws_db_instance" "fail" {
  allocated_storage                   = 20
  storage_type                        = "gp2"
  engine                              = "mysql"
  engine_version                      = "5.7"
  instance_class                      = "db.t2.micro"
  name                                = "mydb"
  username                            = "foo"
  password                            = "foobarbaz"
  iam_database_authentication_enabled = true
  storage_encrypted                   = true
  ca_cert_identifier                  = "rds-ca-2015"
  tags = {
    yor_trace = "0b9772c1-027a-44ad-af89-d8e81a023879"
  }
}

resource "aws_db_instance" "pass" {
  allocated_storage                   = 20
  storage_type                        = "gp2"
  engine                              = "mysql"
  engine_version                      = "5.7"
  instance_class                      = "db.t2.micro"
  name                                = "mydb"
  username                            = "foo"
  password                            = "foobarbaz"
  iam_database_authentication_enabled = true
  storage_encrypted                   = true
  ca_cert_identifier                  = "rds-ca-2019"
  tags = {
    yor_trace = "0cfe4ef7-6de9-471f-8eb3-5b921f9f4cd1"
  }
}

resource "aws_db_instance" "pass2" {
  allocated_storage                   = 20
  storage_type                        = "gp2"
  engine                              = "mysql"
  engine_version                      = "5.7"
  instance_class                      = "db.t2.micro"
  name                                = "mydb"
  username                            = "foo"
  password                            = "foobarbaz"
  iam_database_authentication_enabled = true
  storage_encrypted                   = true
  tags = {
    yor_trace = "58cbfcd9-9696-4885-b6e8-01a21115d0a5"
  }
}
