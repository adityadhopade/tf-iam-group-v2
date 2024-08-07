module "iam_group" {
  source = "./tf-aws-group"
  #group-created with the policies
  group_name = "example-group"
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  ]
  # Users should be pre-existing
  user_names = ["ron1", "ron2"]
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
