# Terraform Cloud

This lesson introduces Terraform Cloud and Terraform Cloud Workspaces.

## Create Account

Go to [Terraform Cloud](https://app.terraform.io/) and create a Free account.
Setup an Organization, if default one is not created for you.

## AWS Credentials

1. Log into [AWS Console](https://console.aws.amazon.com/)
1. Generate Access Keys (just like we did in the module 1)

## Create New TF Cloud Workspace

In TF Cloud portal...

1. Create new workspace
1. Select `CLI-drive workflow`
1. Name the workspace `cli-workspace`
1. [Create variable group](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables/managing-variables#workspace-specific-variables) that Terraform will use to authenticate with AWS

  ```bash
  AWS_ACCESS_KEY_ID="anaccesskey"
  AWS_SECRET_ACCESS_KEY="asecretkey"
  AWS_REGION="us-west-2"
  ```

1. Generate user token in Terraform cloud (save this for later)

## Configure TF Project

1. Log into Terraform cloud (using token you generated earlier)

  ```bash
  terraform login
  ```

1. Update the [backend.tf](./start/backend.tf) so it references the Terraform Cloud workspace you created earlier.
1. Initialize and launch apply using TF Cloud

  ```bash
  terraform init
  terraform apply
  ```

1. Review plan and approve run on TF Cloud site
1. Clean up after yourself by destroying infrastructure using TF Cloud
