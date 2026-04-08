resource "aws_eks_cluster" "prod" {
  name     = "prod"
  role_arn = var.eks_role_arn
  version  = var.cluster_version

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = false

    security_group_ids = [aws_security_group.eks_sg.id]

    subnet_ids = [
      aws_subnet.public_subnet_1.id,
      aws_subnet.public_subnet_2.id,
      aws_subnet.private_subnet_1.id,
      aws_subnet.private_subnet_2.id
    ]
  }

  enabled_cluster_log_types = [
    "api",
    "controllerManager",
    "scheduler"
  ]

  tags = {
    Env  = "prod"
    Name = "prod"
  }
}