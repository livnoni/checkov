resource "aws_db_security_group" "exists" {
  name = "rds_sg"

  ingress {
    cidr = "10.0.0.0/24"
  }
  tags = {
    yor_trace = "c180a1bf-81f2-43d9-8c17-c10afb0b729e"
  }
}