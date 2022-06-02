resource "github_repository" "this" {
  name                   = var.name
  visibility             = var.visibility
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  allow_merge_commit     = var.allow_merge_commit
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  allow_auto_merge       = var.allow_auto_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  has_downloads          = var.has_downloads
  archive_on_destroy     = var.archive_on_destroy
  vulnerability_alerts   = var.vulnerability_alerts

  dynamic "template" {
    for_each = var.from_template ? [1] : []
    content {
      owner      = var.template_owner
      repository = var.template_repository
    }
  }

  lifecycle {
    prevent_destroy = true
    # Imported repos can show perpetual drift for the template
    ignore_changes = [template, description]
  }
}

resource "github_branch_default" "this" {
  count      = var.from_template ? 1 : 0 # default branch cannot be set on an empty repository
  repository = github_repository.this.name
  branch     = var.default_branch
}

resource "github_branch_protection" "this" {
  repository_id           = github_repository.this.node_id
  pattern                 = var.default_branch
  enforce_admins          = var.enforce_admins
  require_signed_commits  = var.require_signed_commits
  required_linear_history = var.required_linear_history
  allows_force_pushes     = var.allows_force_pushes
  push_restrictions       = var.push_restrictions

  required_status_checks {
    strict   = var.required_status_checks_strict
    contexts = var.required_status_checks
  }

  dynamic "required_pull_request_reviews" {
    for_each = var.required_pull_request_reviews == true ? [1] : []
    content {
      dismiss_stale_reviews           = var.dismiss_stale_reviews
      dismissal_restrictions          = var.dismissal_restrictions
      require_code_owner_reviews      = var.require_code_owner_reviews
      required_approving_review_count = var.required_approving_review_count
    }
  }
}