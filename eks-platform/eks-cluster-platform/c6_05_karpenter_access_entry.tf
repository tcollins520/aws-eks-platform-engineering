resource "aws_eks_access_entry" "karpenter_node_access" {
  depends_on = [aws_eks_cluster.main]
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = aws_iam_role.karpenter_node.arn
  type          = "EC2_LINUX"
}
