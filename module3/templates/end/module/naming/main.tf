terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }

  required_version = ">= 1.3.0"
}

resource "random_string" "random" {
  length  = 3
  special = false
  upper   = false
}
