resource "aws_iam_group" "group" {
  name = var.group_name
}

resource "aws_iam_group_policy_attachment" "group_policies" {
  for_each   = toset(var.policy_arns)
  group      = aws_iam_group.group.name
  policy_arn = each.value
}

resource "aws_iam_user_group_membership" "group_membership" {
  for_each = toset(var.user_names)
  user     = each.value
  groups   = [aws_iam_group.group.name]
}

