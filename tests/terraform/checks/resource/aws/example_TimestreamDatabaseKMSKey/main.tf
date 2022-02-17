# pass

resource "aws_timestreamwrite_database" "enabled" {
  database_name = "timestream"

  kms_key_id = var.kms_key_id
  tags = {
    yor_trace = "4c433e93-3302-4293-91c4-f89cdb5a217b"
  }
}

# failure

resource "aws_timestreamwrite_database" "default" {
  database_name = "timestream"
  tags = {
    yor_trace = "4ad17ff2-cc67-4030-a50f-ef608e50e777"
  }
}
