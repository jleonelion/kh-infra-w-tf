# Jenkins Server

This terraform code creates a simple Jenkins server in AWS (listening to port 8080)

## Setup

```bash
cd module6/jenkins
```

### Generate SSH Key Pair

Generate a key pair that will be used to access the Jenkins server.
Run the the following commands from the same directory that has your Terraform configuration:

```bash
# make sure you have .ssh directory
mkdir -p ~/.ssh
# generate key pair in your ssh directory
ssh-keygen -t rsa -f ~/.ssh/jenkins_rsa
# now copy the public key into a file location that Terraform expects the file to be
cp ~/.ssh/jenkins_rsa.pub jenkins_rsa.pub
```

## Provision Jenkins Project

Provision the Jenkins Terraform project.  This assumes you have cached AWS credentials from prior activities.

```bash
terraform init
terraform apply --auto-approve
```

## Log into Jenkins Server

1. The Terraform project will produce an output called `jenkins_ssh`...run that command to SSH into the Jenkins server.
1. Extract the initial admin password by executing the following command from your SSH session

  ```bash
  sudo cat /var/lib/jenkins/secrets/initialAdminPassword
  ```

## Jenkins Application Setup

1. The Terraform project will produce an output called `jenkins_url`...open that URL in your browser.
1. Paste the intial password you obtained in your SSH session
1. Complete Jenkins setup
