terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 4.18.2, < 7.0.0"
    }
  }
}