# Create repo from template repository
module "test1" {
  source                        = "../../"
  name                          = "terraform-github-repository-test1"
  required_pull_request_reviews = false
  from_template                 = true
  template_owner                = "champ-oss"
  template_repository           = "terraform-module-template"
}

# Create repo from scratch
module "test2" {
  source                        = "../../"
  name                          = "terraform-github-repository-test2"
  required_pull_request_reviews = false
  from_template                 = false
}