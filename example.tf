module "iam_group" {
  source = "./tf-aws-group"
  #group-created with the polcies
  group_name = "example-group"
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  ]
  # Users should be pre-existing
  user_names = ["ron1", "ron2"]
}
