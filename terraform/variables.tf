
# Define input variables
variable "default_branch" {
  type    = string
  default = "main"
}

variable "license_template" {
  type    = string
  default = "mit"
}

variable "github_token" {
  type        = string
  description = ""
}

variable "github_owner" {
  type        = string
  description = "NHSDigital"
}

variable "required_approving_review_count" {
  type        = string
  description = "1"

}

variable "visibilty" {
  type    = string
  default = "internal"
}

variable "foo" {

}
