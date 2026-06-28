#############################################
# User Management IAM Policy
#############################################

resource "aws_iam_policy" "usermgmt_iam_policy" {

  name        = "${local.name}-UserMgmtSecretsPolicy"
  path        = "/"
  description = "Allows User Management to read database credentials."

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [

      {
        Sid = "ReadDatabaseSecret"

        Effect = "Allow"

        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]

        Resource = [
          "arn:aws:secretsmanager:${var.aws_region}:${data.aws_caller_identity.current.account_id}:secret:mysql-db-secret-1*"
        ]
      }

    ]
  })
}

output "usermgmt_iam_policy_arn" {

  value = aws_iam_policy.usermgmt_iam_policy.arn

}

#############################################
# User Management IAM Role
#############################################

resource "aws_iam_role" "usermgmt_iam_role" {

  name = "${local.name}-usermgmt-iam-role"

  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = {

    Name        = "${local.name}-usermgmt-iam-role"
    Environment = var.environment_name
    Component   = "User Management"
    ManagedBy   = "Terraform"
    Project     = local.name

  }

}

#############################################
# Attach Policy
#############################################

resource "aws_iam_role_policy_attachment" "usermgmt_role_policy_attachment" {

  policy_arn = aws_iam_policy.usermgmt_iam_policy.arn

  role = aws_iam_role.usermgmt_iam_role.name

}

output "usermgmt_iam_role_arn" {

  description = "User Management IAM Role ARN"

  value = aws_iam_role.usermgmt_iam_role.arn

}