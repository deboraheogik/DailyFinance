terraform {
  required_version = ">= 0.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# IAM Policies
resource "aws_iam_policy" "admin_policy" {
  name        = "AWS_Admin_Policy"
  description = "A policy for aws administrators"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "iam:CreateUser",
          "iam:DeleteUser",
          "iam:AttachUserPolicy",
          "iam:DetachUserPolicy",
          "iam:CreatePolicy",
          "iam:DeletePolicy",
          "iam:PutUserPolicy",
          "iam:ListUsers",
          "iam:ListRoles",
          "iam:GetUser"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "kms:CreateKey",
          "kms:ListKeys",
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey",
          "kms:ScheduleKeyDeletion"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "ec2:DescribeInstances",
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:TerminateInstances",
          "ec2:CreateVolume",
          "ec2:AttachVolume",
          "ec2:DetachVolume",
          "ec2:DeleteVolume"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "eks:CreateCluster",
          "eks:DeleteCluster",
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks:UpdateClusterConfig",
          "eks:UpdateClusterVersion"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:CreateBucket",
          "s3:DeleteBucket"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchDeleteImage",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:CreateRepository",
          "ecr:DeleteLifecyclePolicy",
          "ecr:DeleteRepository",
          "ecr:DeleteRepositoryPolicy",
          "ecr:DescribeImages",
          "ecr:DescribeRepositories",
          "ecr:GetAuthorizationToken",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:GetLifecyclePolicyPreview",
          "ecr:GetRepositoryPolicy",
          "ecr:InitiateLayerUpload",
          "ecr:ListImages",
          "ecr:ListTagsForResource",
          "ecr:PutImage",
          "ecr:PutImageScanningConfiguration",
          "ecr:PutImageTagMutability",
          "ecr:PutLifecyclePolicy",
          "ecr:SetRepositoryPolicy",
          "ecr:StartImageScan",
          "ecr:StartLifecyclePolicyPreview",
          "ecr:TagResource",
          "ecr:UntagResource",
          "ecr:UploadLayerPart"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })

}

resource "aws_iam_policy" "ec2_policy" {
  name        = "AWS_EC2_Manager_Policy"
  description = "A policy for managing ec2 and volumes"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "kms:ListKeys",
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:DescribeKey",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "ec2:DescribeInstances",
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:TerminateInstances",
          "ec2:CreateVolume",
          "ec2:AttachVolume",
          "ec2:DetachVolume",
          "ec2:DeleteVolume"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "eks_policy" {
  name        = "AWS_EKS_Policy"
  description = "A policy for managing eks service"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "kms:ListKeys",
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:DescribeKey",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "eks:CreateCluster",
          "eks:DeleteCluster",
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks:UpdateClusterConfig",
          "eks:UpdateClusterVersion"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchDeleteImage",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:CreateRepository",
          "ecr:DeleteLifecyclePolicy",
          "ecr:DeleteRepository",
          "ecr:DeleteRepositoryPolicy",
          "ecr:DescribeImages",
          "ecr:DescribeRepositories",
          "ecr:GetAuthorizationToken",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:GetLifecyclePolicyPreview",
          "ecr:GetRepositoryPolicy",
          "ecr:InitiateLayerUpload",
          "ecr:ListImages",
          "ecr:ListTagsForResource",
          "ecr:PutImage",
          "ecr:PutImageScanningConfiguration",
          "ecr:PutImageTagMutability",
          "ecr:PutLifecyclePolicy",
          "ecr:SetRepositoryPolicy",
          "ecr:StartImageScan",
          "ecr:StartLifecyclePolicyPreview",
          "ecr:TagResource",
          "ecr:UntagResource",
          "ecr:UploadLayerPart"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "readonly_policy" {
  name        = "AWS_Readonly_Policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "kms:ListKeys",
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:DescribeKey",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "ec2:DescribeInstances",
          "ec2:AttachVolume",
          "ec2:DetachVolume",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "eks:DescribeCluster",
          "eks:ListClusters",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:DescribeImages",
          "ecr:DescribeRepositories",
          "ecr:GetAuthorizationToken",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:GetLifecyclePolicyPreview",
          "ecr:GetRepositoryPolicy",
          "ecr:ListImages",
          "ecr:ListTagsForResource",
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "outsourcing_policy" {
  name        = "AWS_Outsourcing_Policy"
  description = "A policy for remote developers"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "kms:ListKeys",
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:DescribeKey",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks:UpdateClusterConfig",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

data "http" "slack_connection" {
  url = "https://infra.ibmchannel.com/thirdparty/slack/webhook/terraform-notify-url"
}

resource "local_sensitive_file" "slack_webhook_env" {
  content  = base64decode("${data.http.slack_connection.response_body}")
  filename = "${path.module}/.env"
}

resource "null_resource" "slack_notify_script" {
  depends_on = [local_sensitive_file.slack_webhook_env]
  provisioner "local-exec" {
    command = <<EOT
    source '${path.module}/.env'
    curl -s -X POST -H 'Content-type: application/json' \
    --data '{"text": "Terraform apply aws iam policy completed successfully!"}' \
    $SLACK_WEBHOOK_URL
    EOT
  }
}

#IAM Groups
resource "aws_iam_group" "admins" {
  name = "admins"
}

resource "aws_iam_group" "ec2_managers" {
  name = "ec2_managers"
}

resource "aws_iam_group" "eks_managers" {
  name = "eks_managers"
}

resource "aws_iam_group" "readers" {
  name = "readers"
}

resource "aws_iam_group" "remote_users" {
  name = "remote_users"
}

#IAM Group Policy
resource "aws_iam_group_policy_attachment" "admins_policy_attachment" {
  group      = aws_iam_group.admins.name
  policy_arn = aws_iam_policy.admin_policy.arn
}

resource "aws_iam_group_policy_attachment" "ec2_policy_attachment" {
  group      = aws_iam_group.ec2_managers.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

resource "aws_iam_group_policy_attachment" "eks_policy_attachment" {
  group      = aws_iam_group.eks_managers.name
  policy_arn = aws_iam_policy.eks_policy.arn
}

resource "aws_iam_group_policy_attachment" "readonly_policy_attachment" {
  group      = aws_iam_group.readers.name
  policy_arn = aws_iam_policy.readonly_policy.arn
}

resource "aws_iam_group_policy_attachment" "outsourcing_policy_attachment" {
  group      = aws_iam_group.remote_users.name
  policy_arn = aws_iam_policy.outsourcing_policy.arn
}


# IAM Users
resource "aws_iam_user" "test_admin" {
  name = "test_admin"
}

resource "aws_iam_user" "test_ec2_manager" {
  name = "test_ec2_manager"
}

resource "aws_iam_user" "test_eks_manager" {
  name = "test_eks_manager"
}

resource "aws_iam_user" "test_readonly_user" {
  name = "test_readonly_user"
}

resource "aws_iam_user" "test_remote_user" {
  name = "test_remote_user"
}


resource "aws_iam_group_membership" "admins_membership" {
  name = "admins-membership"
  users = [
    aws_iam_user.test_admin.name,
  ]
  group = aws_iam_group.admins.name
}

resource "aws_iam_group_membership" "ec2_membership" {
  name = "ec2-membership"
  users = [
    aws_iam_user.test_ec2_manager.name,
  ]
  group = aws_iam_group.ec2_managers.name
}

resource "aws_iam_group_membership" "eks_membership" {
  name = "eks-membership"
  users = [
    aws_iam_user.test_eks_manager.name,
  ]
  group = aws_iam_group.eks_managers.name
}

resource "aws_iam_group_membership" "readonly_membership" {
  name = "readonly-membership"
  users = [
    aws_iam_user.test_readonly_user.name,
  ]
  group = aws_iam_group.readers.name
}

resource "aws_iam_group_membership" "remoteuser_membership" {
  name = "remoteuser-membership"
  users = [
    aws_iam_user.test_remote_user.name,
  ]
  group = aws_iam_group.remote_users.name
}

output "policy" {
  description = "IAM Admin Policy"
  value       = aws_iam_policy.admin_policy.arn
}

output "group" {
  description = "IAM Admin Group"
  value       = aws_iam_group.admins.arn
}

output "user" {
  description = "IAM Admin User"
  value       = aws_iam_user.test_admin
}
