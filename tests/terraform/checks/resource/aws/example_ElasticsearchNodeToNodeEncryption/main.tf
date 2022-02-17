# pass
resource "aws_elasticsearch_domain" "without_cluster_config" {
  domain_name = "without_cluster_config"
  tags = {
    yor_trace = "604f028c-ce90-4d10-9dde-aed575ab85c4"
  }
}

resource "aws_elasticsearch_domain" "without_instance_count" {
  domain_name = "without_instance_count"

  cluster_config {}
  tags = {
    yor_trace = "d68015cc-eb3d-4747-9c43-6afaf9156f86"
  }
}

resource "aws_elasticsearch_domain" "instance_count_not_bigger_than_1" {
  domain_name = "instance_count_not_bigger_than_1"

  cluster_config {
    instance_count = 1 // a value <= 1
  }
  tags = {
    yor_trace = "8fca536d-0ef9-4c91-aeaf-0c161434a38d"
  }
}

resource "aws_elasticsearch_domain" "node_to_node_encryption_enabled" {
  domain_name = "node_to_node_encryption_enabled"

  cluster_config {
    instance_count = 2 // a value > 1
  }

  node_to_node_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "2feddef0-4cee-4be6-930e-1ccb2b4efef8"
  }
}

resource "aws_elasticsearch_domain" "old_hcl" {
  domain_name = "old_hcl"

  cluster_config = {
    instance_count = 2
  }

  node_to_node_encryption = {
    enabled = true
  }
  tags = {
    yor_trace = "955544ae-349d-464f-ae03-0c2d716251c7"
  }
}

# fail
resource "aws_elasticsearch_domain" "node_to_node_encryption_disabled" {
  domain_name = "node_to_node_encryption_disabled"

  cluster_config {
    instance_count = 2 // a value > 1
  }

  node_to_node_encryption {
    enabled = false
  }
  tags = {
    yor_trace = "642e4db3-bd60-468e-ab66-7cc6f5debf5c"
  }
}

resource "aws_elasticsearch_domain" "node_to_node_encryption_doesnt_exist" {
  domain_name = "node_to_node_encryption_doesnt_exist"

  cluster_config {
    instance_count = 2 // a value > 1
  }
  tags = {
    yor_trace = "e7bdc8f2-15e1-4254-87fa-c1f6b257602e"
  }
}

# unknown
resource "aws_elasticsearch_domain" "instance_count_not_number" {
  domain_name = "instance_count_not_number"

  cluster_config {
    instance_count = "not_int"
  }
  tags = {
    yor_trace = "a80427f0-d09c-4b8b-8f4e-040989e35894"
  }
}