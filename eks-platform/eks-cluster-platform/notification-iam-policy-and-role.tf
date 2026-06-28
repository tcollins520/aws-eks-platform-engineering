#############################################
# User Management IAM Policy
#############################################

resource "aws_iam_policy" "notification_iam_policy" {

  name        = "${local.name}-NotificationSecretsPolicy"
  path        = "/"
  description = "Allows Notification service to read SMTP credentials."

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
          "arn:aws:secretsmanager:${var.aws_region}:${data.aws_caller_identity.current.account_id}:secret:notification-email-secret*"
        ]
      }

    ]
  })
}

output "notification_iam_policy_arn" {

  value = aws_iam_policy.notification_iam_policy.arn

}

#############################################
# User Management IAM Role
#############################################

resource "aws_iam_role" "notification_iam_role" {

  name = "${local.name}-notification-iam-role"

  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = {

    Name        = "${local.name}-notification-iam-role"
    Environment = var.environment_name
    Component   = "Notification"
    ManagedBy   = "Terraform"
    Project     = local.name

  }

}

#############################################
# Attach Policy
#############################################

resource "aws_iam_role_policy_attachment" "notification_role_policy_attachment" {

  policy_arn = aws_iam_policy.notification_iam_policy.arn

  role = aws_iam_role.notification_iam_role.name

}

output "notification_iam_role_arn" {

  description = "Notification IAM Role ARN"

  value = aws_iam_role.notification_iam_role.arn

}