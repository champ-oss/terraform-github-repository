terraform {
  required_version = ">= 1.5.0"
}

# Create repo from template repository
module "test1" {
  source                        = "../../"
  name                          = "terraform-github-repository-test1"
  required_pull_request_reviews = false
  from_template                 = true
  template_owner                = "champ-oss"
  template_repository           = "terraform-module-template"
  visibility                    = "public"
  archive_on_destroy            = false
  actions_variables = {
    test_variable1 = "value123"
    test_variable2 = "value456"
  }
}

# Create repo from scratch
module "test2" {
  source                        = "../../"
  name                          = "terraform-github-repository-test2"
  required_pull_request_reviews = false
  from_template                 = false
  visibility                    = "public"
  archive_on_destroy            = false
}
