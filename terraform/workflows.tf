resource "github_repository_file" "reusable_workflow_caller" {
  repository          = github_repository.repository.name
  branch              = github_branch_default.default_branch.branch
  file                = ".github/workflows/reusable_workflow_caller.yaml"
  content             = file("../workflows/reusable_workflow_caller.yaml")
  overwrite_on_create = true
}

resource "github_repository_file" "tflint" {
  repository          = github_repository.repository.name
  branch              = github_branch_default.default_branch.branch
  file                = ".github/workflows/tflint.yaml"
  content             = file("../workflows/tflint.yaml")
  overwrite_on_create = true
}

resource "github_repository_file" "tfsec" {
  repository          = github_repository.repository.name
  branch              = github_branch_default.default_branch.branch
  file                = ".github/workflows/tfsec.yaml"
  content             = file("../workflows/tfsec.yaml")
  overwrite_on_create = true
}

resource "github_repository_file" "checkov" {
  repository          = github_repository.repository.name
  branch              = github_branch_default.default_branch.branch
  file                = ".github/workflows/checkov.yaml"
  content             = file("../workflows/checkov.yaml")
  overwrite_on_create = true
}

resource "github_repository_file" "terraform" {
  repository          = github_repository.repository.name
  branch              = github_branch_default.default_branch.branch
  file                = ".github/workflows/terraform.yaml"
  content             = file("../workflows/terraform.yaml")
  overwrite_on_create = true
}
