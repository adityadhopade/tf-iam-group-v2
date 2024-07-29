# IAM Group Terraform Module

This Terraform module creates an IAM Group in AWS along with the policies and custom polcies attaching to the groups

## Usage

To use this module, include the following code in your Terraform configuration:

```
module "iam_group" {
  source = "./tf-aws-group"
  # group named as "example-group" created with the policies
  group_name = "example-group"

  policy_arns = [
    "<attach-your-policies-arn>",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  ]
  # Users should be pre-existing
  user_names = ["ron1", "ron2"]

  # Adding Custom Policies to the Users
  custom_policy_document = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "s3:ListBucket",
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action   = "ec2:DescribeInstances",
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}
```

## Requirements:

| Name      | Version |
| --------- | ------- |
| terraform | >=0.12  |
| aws       | >=2.0   |
