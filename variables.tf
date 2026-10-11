variable "billing_account_iam_members" {
  description = <<EOT
Map of billing_account_iam_members, attributes below
Required:
    - billing_account_id
    - member
    - role
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    billing_account_id = string
    member             = string
    role               = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

