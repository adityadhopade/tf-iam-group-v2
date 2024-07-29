variable "group_name" {
  description = "The name of the IAM group"
  type        = string
}

variable "policy_arns" {
  description = "A list of policy ARNs to attach to the group"
  type        = list(string)
}

variable "user_names" {
  description = "A list of user names to attach to the group"
  type        = list(string)
}

variable "custom_policy_document" {
  description = "The custom policy document to attach to each user"
  type        = string
}
