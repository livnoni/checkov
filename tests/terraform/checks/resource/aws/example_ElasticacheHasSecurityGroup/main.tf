resource "aws_elasticache_security_group" "exists" {
  name                 = "elasticache-security-group"
  security_group_names = [aws_security_group.bar.name]
}

resource "aws_security_group" "bar" {
  name = "security-group"
  tags = {
    yor_trace = "70578ef8-5b91-4739-bd2d-c8604ad6dd77"
  }
}