resource "aws_api_gateway_stage" "pass" {
  name                  = "example"
  cache_cluster_enabled = true
  tags = {
    yor_trace = "fb9f12c9-1497-4221-bfbe-d5b793292576"
  }
}

resource "aws_api_gateway_stage" "fail" {
  name = "example"
  tags = {
    yor_trace = "6c0fc02a-da41-404c-84c4-dc801975a94a"
  }
}


