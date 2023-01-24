# AWS IaaS Sample

This terraform code creates a simple IaaS solution in AWS.  We put two EC2 webservers behind a load balancer that is exposed to the public internet.  We also expose SSH to one of the servers.

## Setup

```bash
cd module2/iaas/start
```

### AWS Credentials

Configure [AWS credentials file](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) with the following commands:

```bash
# unset environment variables from prior excercise
unset AWS_SECRET_ACCESS_KEY
unset AWS_ACCESS_KEY_ID
# configure aws
aws configure
# enter your secret id and secret key
```

Now your AWS credentials are stored in ~/.aws/credentials

### SSH Key Pair

Generate a key pair that will be used to access the EC2.
Run the the following commands from the same directory that has your Terraform configuration:

```bash
# make sure you have .ssh directory
mkdir -p ~/.ssh
# generate key pair in your ssh directory
ssh-keygen -t rsa -f ~/.ssh/ec2_rsa
# now copy the public key into a file location that Terraform expects the file to be
cp ~/.ssh/ec2_rsa.pub ec2_rsa.pub
```

## Refactoring Excercise

After exploring the configuration, go through the process of extracting certain constants into variables.

Copy the [variables.tf](./end/variables.tf) file into your working directory and update the appropriate code areas in the other .tf files.

## A Closer Look at Statefiles

With the solution still deployed to AWS, let's take a look at the important statefile to really understand what it does and how to manage it.

1. Open the state file, but don't edit it!
1. Run common terraform commands to [inspect infrastructure](https://developer.hashicorp.com/terraform/cli/inspect)

  ```bash
  terraform show
  terraform state list
  terraform state show
  ```

1. Run command to force replacement of infrastructure

  ```bash
  terraform apply -replace 
  ```

1. Run command to [remove a resource from state file](https://developer.hashicorp.com/terraform/cli/commands/state/rm)

  ```bash
  terraform state rm aws_security_group.server
  ```

1. Run command to [import security group into statefile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#import)

  ```bash
  terraform import aws_security_group.server <sg-xxxxxx>
  ```
