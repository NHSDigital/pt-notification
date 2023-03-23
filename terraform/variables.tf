variable "default_branch" {
  type    = string
  default = "main"
}

variable "license_template" {
  type    = string
  default = "mit"
}

variable "github_token" {
  type    = string
  default = "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"
}

variable "github_owner" {
  type    = string
  default = "NHSDigital"
}

variable "required_approving_review_count" {
  type    = number
  default = 1

}

variable "visibilty" {
  type    = string
  default = "internal"
}

variable "repository_name" {
  type    = string
  default = "tf-gh-repo-test"
}
