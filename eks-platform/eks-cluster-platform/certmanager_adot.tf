# Datasource: To get default EKS addon version compatible with EKS cluster version
data "aws_eks_addon_version" "cert_manager_default" {
  addon_name         = "cert-manager"
  kubernetes_version = aws_eks_cluster.main.version
}

# Datasource: To get latest EKS addon version compatible with EKS cluster version
data "aws_eks_addon_version" "cert_manager_latest" {
  addon_name         = "cert-manager"
  kubernetes_version = aws_eks_cluster.main.version
  most_recent        = true
}

# cert-manager EKS Addon (Prerequisite for ADOT)
resource "aws_eks_addon" "cert_manager" {
  cluster_name                = local.eks_cluster_name
  addon_name                  = "cert-manager"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  addon_version               = data.aws_eks_addon_version.cert_manager_latest.version
  tags = var.tags
}
