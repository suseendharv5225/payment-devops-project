resource "aws_eks_cluster" "main" {
  name     = "production-eks"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.33"

  vpc_config {
    subnet_ids = [
      aws_subnet.eks_private_a.id,
      aws_subnet.eks_private_b.id,
      aws_subnet.eks_private_c.id
    ]

    endpoint_private_access = false
    endpoint_public_access  = true
  }

  tags = {
    Name        = "production-eks"
    Environment = "production"
    ManagedBy   = "terraform"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}
