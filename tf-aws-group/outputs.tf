output "group_name" {
  description = "The name of the IAM group"
  value       = aws_iam_group.group.name
}

output "group_policy_arns" {
  description = "The ARNs of the policies attached to the group"
  #value       = aws_iam_group_policy_attachment.group_policies[*].policy_arn
  value = [for p in aws_iam_group_policy_attachment.group_policies : p.policy_arn]
}

output "group_users" {
  description = "The users attached to the group"
  #value       = aws_iam_user_group_membership.group_membership[*].user
  value = keys(aws_iam_user_group_membership.group_membership)
}
