resource "aws_ecs_cluster" "cluster" {
  name = format(
    "%s-%s-CLUSTER",
    var.company,
    var.environment
  )
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_cp" {
  cluster_name       = aws_ecs_cluster.cluster.name
  capacity_providers = ["FARGATE_SPOT", "FARGATE"]
  default_capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
  }
}




