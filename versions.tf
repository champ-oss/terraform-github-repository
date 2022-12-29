terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 4.18.2, < 6.0.0"
    }
  }
}