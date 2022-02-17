# pass

resource "aws_neptune_cluster" "enabled" {
  cluster_identifier = "example"
  engine             = "neptune"

  storage_encrypted = true
  tags = {
    yor_trace = "4bb1b556-6af9-4a1c-8591-ae25f7c39bd5"
  }
}

# fail

resource "aws_neptune_cluster" "default" {
  cluster_identifier = "example"
  engine             = "neptune"
  tags = {
    yor_trace = "28156980-6c7c-4a3d-9165-df216ad8ae97"
  }
}

resource "aws_neptune_cluster" "disabled" {
  cluster_identifier = "example"
  engine             = "neptune"

  storage_encrypted = false
  tags = {
    yor_trace = "9cc62f1b-89c5-4ca3-9d83-a02e12747329"
  }
}
