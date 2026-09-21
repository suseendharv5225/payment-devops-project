# ==========================================
# EKS Managed Node Group
# ==========================================

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "production-node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = [
    aws_subnet.eks_private_a.id,
    aws_subnet.eks_private_b.id,
    aws_subnet.eks_private_c.id
  ]

  # Scaling configuration
  scaling_config {
    desired_size = 3
    min_size     = 1
    max_size     = 4
  }

  # EC2 instance type
  instance_types = ["t3.small"]

  # Disk size
  disk_size = 25

  # Update configuration
  update_config {
    max_unavailable = 1
  }

  tags = {
    Name        = "production-eks-node-group"
    Environment = "production"
    ManagedBy   = "terraform"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.eks_ecr_read_only
  ]
}
