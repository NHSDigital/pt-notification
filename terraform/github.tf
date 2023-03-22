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
  repository_id           = github_repository.repository.node_id
  pattern                 = github_branch_default.default_branch.branch
  enforce_admins          = true
  allows_deletions        = false
  required_linear_history = true
  allows_force_pushes     = false

  required_pull_request_reviews {
    required_approving_review_count = var.required_approving_review_count
  }
}
