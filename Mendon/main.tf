# Creation of Standalone ElastiCache Redis Cluster

resource "aws_elasticache_cluster" "example" {           # Creating a resource ElasticCache Cluster
  cluster_id           = "cluster-example"                               # Defining a cluster name “cluster-example”
  engine               = "redis"                                                    # Defining an engine as Redis
  node_type            = "cache.t2.micro"                               # Selecting a node type as t2 micro
  num_cache_nodes      = 1                                                   # Selecting a number of nodes as 1
  parameter_group_name = "default.redis5.0"                # Keeping a parameter group as default
  engine_version       = "5.0.5"                                              # Defining engine version to latest
  port                 = 6379                                                            # Setting the Redis port to default
}

# Creation of Advanced Redis Cluster

resource "aws_elasticache_replication_group" "default" {
  replication_group_id          = var.cluster_id
  replication_group_description = "Redis cluster for Hashicorp ElastiCache example"

  node_type            = "cache.t2.micro"
  port                 = 6379
  parameter_group_name = "default.redis5.0.cluster.on"

  subnet_group_name          = aws_elasticache_subnet_group.default.name
  automatic_failover_enabled = true

  cluster_mode {
    replicas_per_node_group = 1
    num_node_groups         = var.node_groups
  }
}

