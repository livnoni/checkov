# pass

resource "aws_qldb_ledger" "default" {
  name             = "ledger"
  permissions_mode = "STANDARD"
  tags = {
    yor_trace = "3e387ab1-cdc0-47b3-b1ba-f56db775216b"
  }
}

resource "aws_qldb_ledger" "enabled" {
  name             = "ledger"
  permissions_mode = "STANDARD"

  deletion_protection = true
  tags = {
    yor_trace = "fccf090d-e8a7-483c-a879-56a9f3b207f7"
  }
}

# failure

resource "aws_qldb_ledger" "disabled" {
  name             = "ledger"
  permissions_mode = "STANDARD"

  deletion_protection = false
  tags = {
    yor_trace = "c49fa4fe-a085-45d4-9a7f-9431089dc69b"
  }
}
