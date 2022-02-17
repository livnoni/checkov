# pass

resource "aws_qldb_ledger" "standard" {
  name             = "ledger"
  permissions_mode = "STANDARD"
  tags = {
    yor_trace = "260d324e-31da-4238-b9ac-d6e6ee9b7833"
  }
}

# failure

resource "aws_qldb_ledger" "allow_all" {
  name             = "ledger"
  permissions_mode = "ALLOW_ALL"
  tags = {
    yor_trace = "9186ec95-86c3-48d6-b566-bf544d5b2a9c"
  }
}
