terraform {
  cloud {
    # you are going to change this to be name of whatever org you created
    organization = "org-name"

    workspaces {
      name = "cli-workspace"
    }
  }
}
