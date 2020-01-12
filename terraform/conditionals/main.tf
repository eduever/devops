# resource "aws_iam_user" "example" {
#     count = length(var.user_names)
#     name  = var.user_names[count.index]
# }



resource "aws_iam_user" "example" {
    name = "test"
    
    dynamic "tag" {
     for_each = var.custom_tags
     content {
         key                 = tag.key
         value               = tag.value
        }
    }
}

# resource "aws_iam_user" "example" {
# #   for_each = toset(var.user_names)
#   name     = "test-iam" 
#     dynamic "tag" {
#     for_each = var.custom_tags
#     content {
#       key                 = tag.key
#       value               = tag.value

#   dynamic "tag" {
#       for_each = tomap(var.custom_tags)
      
#       content {
#           key                 = tag.key
#           value               = tag.value
#         }

#     }
# }

variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["rutwik", "madam"]
}

variable "custom_tags" {
  description = "Custom tags to set on the IAM users"
  type        = map(string)
  default     = {"project" = "terraform", "env" = "test"}
#   type        = list(string)
#   default     = ["test","env"]
}

output "all_users" {
  value = aws_iam_user.example
}

output "all_arns" {
  value = values(aws_iam_user.example)[*].arn
}

# output "all_arns" {
#   value       = aws_iam_user.example[*].arn
#   description = "The ARNs for all users"
# }




