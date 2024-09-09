## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.0 |

## Resources

### Policy
| Name | Data Source | Type | Detail |
|------|-------------|------|--------|
| [aws_iam_policy.admin_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | aws_iam_policy | resource | • IAM FullAccess<br>• EC2 FullAccess<br>• EKS FullAccess<br>• ECR FullAccess<br>• S3 FullAccess<br>• KMS FullAccess|
| [aws_iam_policy.ec2_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | aws_iam_policy | resource | • EC2 FullAccess<br>• KMS En/Decrypt|
| [aws_iam_policy.eks_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | aws_iam_policy | resource | • EKS FullAccess<br>• ECR FullAccess<br>• KMS En/Decrypt|
| [aws_iam_policy.readonly_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | aws_iam_policy | resource | • EC2 Read<br>• EKS Read<br>• ECR Read<br>• S3 Read<br>• KMS En/Decrypt|
| [aws_iam_policy.outsourcing_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | aws_iam_policy | resource | • EKS Read<br>• S3 Read<br>• KMS En/Decrypt |

### Group
| Name | Data Source | Type |
|------|-------------|------|
| [aws_iam_group.admins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | aws_iam_group | resource |
| [aws_iam_group.ec2_managers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | aws_iam_group | resource |
| [aws_iam_group.eks_managers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | aws_iam_group | resource |
| [aws_iam_group.readers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | aws_iam_group | resource |
| [aws_iam_group.remote_users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | aws_iam_group | resource |

### User
| Name | Data Source | Type |
|------|-------------|------|
| [aws_iam_role_policy_attachment.admins_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | aws_iam_role_policy_attachment | resource |
| [aws_iam_role_policy_attachment.ec2_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | aws_iam_role_policy_attachment | resource |
| [aws_iam_role_policy_attachment.eks_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | aws_iam_role_policy_attachment | resource |
| [aws_iam_role_policy_attachment.readonly_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | aws_iam_role_policy_attachment | resource |
| [aws_iam_role_policy_attachment.outsourcing_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | aws_iam_role_policy_attachment | resource |
| [aws_iam_group_membership.test_admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | aws_iam_group_membership | resource |
| [aws_iam_group_membership.test_ec2_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | aws_iam_group_membership | resource |
| [aws_iam_group_membership.test_eks_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | aws_iam_group_membership | resource |
| [aws_iam_group_membership.test_readonly_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | aws_iam_group_membership | resource |
| [aws_iam_group_membership.test_remote_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | aws_iam_group_membership | resource |

## Notification

### Slack

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy"></a> policy | The Amazon Resource Name (ARN) specifying the iam policy. |
| <a name="output_group"></a> group | The Amazon Resource Name (ARN) specifying the iam group. |
| <a name="output_user"></a> user | The Amazon Resource Name (ARN) specifying the iam user. |