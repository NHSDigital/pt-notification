resource "github_repository_file" "dependabot" {
  repository          = github_repository.repository.name
  branch              = github_branch_default.default_branch.branch
  file                = ".github/dependabot.yaml"
  content             = file("../dependabot/dependabot.yaml")
  overwrite_on_create = true
}
