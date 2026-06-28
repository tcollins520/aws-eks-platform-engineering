resource "aws_eks_pod_identity_association" "notification" {

  cluster_name = aws_eks_cluster.main.name

  namespace = "default"

  service_account = "notification"

  role_arn = aws_iam_role.notification_iam_role.arn

}

output "notification_pod_identity_association_id" {

  value = aws_eks_pod_identity_association.notification.association_id

}