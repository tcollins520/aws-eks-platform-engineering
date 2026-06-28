#############################################
# User Management Pod Identity Association
#############################################

resource "aws_eks_pod_identity_association" "usermgmt" {

  cluster_name = aws_eks_cluster.main.name

  namespace = "default"

  service_account = "usermgmt"

  role_arn = aws_iam_role.usermgmt_iam_role.arn

}

#############################################
# Output
#############################################

output "usermgmt_pod_identity_association_id" {

  value = aws_eks_pod_identity_association.usermgmt.association_id

}