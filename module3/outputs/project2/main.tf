terraform {
  required_version = "~> 1.3.0"
}

# notice no provider is defined, but we are using a resource

# in this example we are reading statefile from local filesystem
# we will cover remote backends for statefiles in future section
# if you are loading a state file from a remote backend, this will look different
# see examples: https://developer.hashicorp.com/terraform/language/state/remote-state-data
data "terraform_remote_state" "project1" {
  backend = "local"

  config = {
    path = "${path.module}/../project1/terraform.tfstate"
  }
}
