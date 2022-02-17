# Do not add more files to this directory.

resource "aws_elb" "learn" {
  instances                   = aws_instance.ubuntu[*].id
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  listener {
    instance_port     = 0
    instance_protocol = ""
    lb_port           = 0
    lb_protocol       = ""
  }
  tags = {
    yor_trace = "095baca7-a5d9-4c05-84da-52f2cbff5b17"
  }
}

resource "aws_elb" "learn1" {
  instances                   = aws_instance.ubuntu[*].id
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  listener {
    instance_port     = 0
    instance_protocol = ""
    lb_port           = 0
    lb_protocol       = ""
  }
  tags = {
    yor_trace = "42ff94f9-394e-40db-af1b-004c8e96e80a"
  }
}

resource "aws_elb" "learn2" {
  instances                   = aws_instance.ubuntu[*].id
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  listener {
    instance_port     = 0
    instance_protocol = ""
    lb_port           = 0
    lb_protocol       = ""
  }
  tags = {
    yor_trace = "21f2256f-b23e-4c80-a47f-89bb0019c872"
  }
}
