variable "name" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#name"
  type        = string
}

variable "visibility" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#visibility"
  type        = string
  default     = "internal"
}

variable "has_issues" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#has_issues"
  type        = bool
  default     = false
}

variable "has_projects" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#has_projects"
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#has_wiki"
  type        = bool
  default     = false
}

variable "allow_merge_commit" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#allow_merge_commit"
  type        = bool
  default     = true
}

variable "allow_squash_merge" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#allow_squash_merge"
  type        = bool
  default     = false
}

variable "allow_rebase_merge" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#allow_rebase_merge"
  type        = bool
  default     = false
}

variable "allow_auto_merge" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#allow_auto_merge"
  type        = bool
  default     = true
}

variable "delete_branch_on_merge" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#delete_branch_on_merge"
  type        = bool
  default     = true
}

variable "has_downloads" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#has_downloads"
  type        = bool
  default     = false
}

variable "archive_on_destroy" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#archive_on_destroy"
  type        = bool
  default     = true
}

variable "vulnerability_alerts" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#vulnerability_alerts"
  type        = bool
  default     = true
}

variable "from_template" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#template-repositories"
  type        = bool
  default     = false
}

variable "template_owner" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#owner"
  type        = string
  default     = ""
}

variable "template_repository" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#repository"
  type        = string
  default     = ""
}

variable "default_branch" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default#branch"
  type        = string
  default     = "main"
}

variable "enforce_admins" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection#enforce_admins"
  type        = bool
  default     = true
}

variable "require_signed_commits" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection#require_signed_commits"
  type        = bool
  default     = false
}

# https://github.com/integrations/terraform-provider-github/issues/952
variable "required_linear_history" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection#required_linear_history"
  type        = bool
  default     = false
}

variable "allows_force_pushes" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection#allows_force_pushes"
  type        = bool
  default     = false
}

variable "required_status_checks" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection#required-status-checks"
  type        = list(string)
  default     = []
}

variable "required_status_checks_strict" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection#strict"
  type        = bool
  default     = true
}

variable "dismiss_stale_reviews" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection#dismiss_stale_reviews"
  type        = bool
  default     = true
}

variable "dismissal_restrictions" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection#dismissal_restrictions"
  type        = list(string)
  default     = []
}

variable "required_pull_request_reviews" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection#required-pull-request-reviews"
  type        = bool
  default     = true
}

variable "require_code_owner_reviews" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection#require_code_owner_reviews"
  type        = bool
  default     = true
}

variable "required_approving_review_count" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection#required_approving_review_count"
  type        = number
  default     = 2
}

variable "push_restrictions" {
  description = "https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection#push_restrictions"
  type        = list(string)
  default     = []
}
