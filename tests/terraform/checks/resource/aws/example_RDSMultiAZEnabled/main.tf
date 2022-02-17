# fail
resource "aws_db_instance" "disabled" {
  name   = "name"
  engine = "mysql"

  identifier     = "id"
  instance_class = "foo"
  multi_az       = false
  tags = {
    yor_trace = "d1c5a57e-f30a-4e6b-a7bd-0eea59472f73"
  }
}

# fail
resource "aws_db_instance" "default" {
  name   = "name"
  engine = "mysql"

  identifier     = "id"
  instance_class = "foo"
  tags = {
    yor_trace = "0a60c44d-7bf0-40a2-9f29-d67b3cbfacec"
  }
}

# pass
resource "aws_db_instance" "enabled" {
  name   = "name"
  engine = "mysql"

  identifier     = "id"
  instance_class = "foo"
  multi_az       = true
  tags = {
    yor_trace = "883d0b57-5cc3-49d1-888c-c354fb7410ee"
  }
}