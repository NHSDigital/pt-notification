terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}


provider "github" {
  token = var.github_token

  owner = var.github_owner
}


resource "github_repository" "repository" {
  name        = var.repository_name
  description = "a fanciful repository"

  visibility = var.visibilty

  vulnerability_alerts   = true
  has_wiki               = true
  delete_branch_on_merge = true
  auto_init              = true
  license_template       = var.license_template
}

resource "github_branch_default" "default_branch" {
  repository = github_repository.repository.name
  branch     = var.default_branch
}

resource "github_branch_protection" "protect_default_branch" {
  # Workaround to ensure files are created before signed commits are enforced
  # and before pull request reviews are enforced
  # all generated files should be here
  depends_on = [
    github_repository_file.reusable_workflow_caller,
    github_repository_file.tflint,
    github_repository_file.tfsec,
    github_repository_file.checkov,
    github_repository_file.terraform,
    github_repository_file.dependabot,
    github_repository_file.github_tf
  ]
  repository_id                   = github_repository.repository.node_id
  pattern                         = github_branch_default.default_branch.branch
  enforce_admins                  = true
  allows_deletions                = false
  allows_force_pushes             = false
  require_signed_commits          = true
  require_conversation_resolution = true

  required_pull_request_reviews {
    required_approving_review_count = var.required_approving_review_count
    dismiss_stale_reviews           = true

  }
}
