# pass

resource "aws_elasticsearch_domain" "enabled" {
  domain_name = "example"

  cluster_config {
    instance_type = "r5.large.elasticsearch"
  }

  encrypt_at_rest {
    enabled = true
  }
  tags = {
    yor_trace = "52b91714-0e81-4df6-9118-0a20baf71503"
  }
}

# fail

resource "aws_elasticsearch_domain" "default" {
  domain_name = "example"

  cluster_config {
    instance_type = "r5.large.elasticsearch"
  }
  tags = {
    yor_trace = "f50d3bc3-ad8d-4cb1-9860-883309ab234f"
  }
}

resource "aws_elasticsearch_domain" "disabled" {
  domain_name = "example"

  cluster_config {
    instance_type = "r5.large.elasticsearch"
  }

  encrypt_at_rest {
    enabled = false
  }
  tags = {
    yor_trace = "0989ff12-6b72-4e9a-8905-0d6e8f32424b"
  }
}
