data "http" "readme_template" {
  url = "https://raw.githubusercontent.com/nhs-england-tools/repository-template/main/README.md"
}

resource "github_repository_file" "readme" {
  repository          = github_repository.repository.name
  branch              = github_branch_default.default_branch.branch
  file                = "README.md"
  content             = data.http.readme_template.response_body
  overwrite_on_create = true
}
