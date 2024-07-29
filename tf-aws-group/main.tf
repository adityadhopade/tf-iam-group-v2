resource "aws_iam_group" "group" {
  name = var.group_name
}

resource "aws_iam_group_policy_attachment" "group_policies" {
  for_each   = toset(var.policy_arns)
  group      = aws_iam_group.group.name
  policy_arn = each.value
}


resource "aws_iam_user_policy" "user_custom_policies" {
  for_each = { for user in var.user_names : user => user }
  name     = "${var.group_name}_custom_policy"
  user     = each.value
  policy   = var.custom_policy_document
}
