resource "google_billing_account_iam_member" "billing_account_iam_members" {
  for_each = var.billing_account_iam_members

  billing_account_id = each.value.billing_account_id
  member             = each.value.member
  role               = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

