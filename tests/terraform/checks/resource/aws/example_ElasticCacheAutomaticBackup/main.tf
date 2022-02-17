# pass

resource "aws_elasticache_cluster" "enabled" {
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"

  snapshot_retention_limit = 5
  tags = {
    yor_trace = "52d11c6d-9bbd-4e53-9408-2102b1e47c82"
  }
}

# failure

resource "aws_elasticache_cluster" "default" {
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  tags = {
    yor_trace = "cbab9cd1-ecfe-4e23-96ba-270053ec65c2"
  }
}

resource "aws_elasticache_cluster" "disabled" {
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"

  snapshot_retention_limit = 0
  tags = {
    yor_trace = "e47903ff-5611-497b-b60e-4ace7417e3b1"
  }
}

# unknown

resource "aws_elasticache_cluster" "memcached" {
  cluster_id           = "cluster"
  engine               = "memcached"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.memcached1.6 "
  tags = {
    yor_trace = "61ad07e9-756a-4fce-a068-7c43f472adab"
  }
}
