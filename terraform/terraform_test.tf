resource "github_repository_file" "github_tf" {
  repository          = github_repository.repository.name
  branch              = github_branch_default.default_branch.branch
  file                = "terraform/github.tf"
  content             = file("github.tf")
  overwrite_on_create = true
}
