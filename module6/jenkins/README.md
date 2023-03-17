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

## Provision Jenkins Infra

Provision the Jenkins Terraform project.  This assumes you have cached AWS credentials from prior activities.

```bash
terraform init
terraform apply --auto-approve
```

## SSH to Jenkins Server

1. The Terraform project will produce an output called `jenkins_ssh`...run that command to SSH into the Jenkins server.
1. Extract the initial admin password by executing the following command from your SSH session

  ```bash
  sudo cat /var/lib/jenkins/secrets/initialAdminPassword
  ```

## Jenkins Initial Setup

1. The Terraform project will produce an output called `jenkins_url`...open that URL in your browser.
1. Paste the intial password you obtained in your SSH session
1. Install Suggested plugins
1. Create silly admin account (username: adminme; password: password; name: Admin Me; email: admin@me.com)
1. Start Using Jenkins

## Add AWS Credentials to Jenkins

1. Generate access key for Terraform account in AWS Console
1. Create username password credentials in Jenkins called `aws` (with the AWS secret)

## GitHub PAT

1. [Create a GitHub personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) that is scoped to accessing this repo
1. Create credentials in Jenkins called `github` (your GitHub username and PAT as password)

## Jenkins Job

1. From main screen, "Create a job"
1. Name: terraform; Type: Multibranch Pipeline
1. Branch Source > setup credential with GitHub PAT
1. Branch Source > paste URL of your repo fork and validate
1. Build Configuration > Script Path

## GitHub Webhook

1. Navigate to the repository on GitHub
1. Settings > Web Hook
1. Payload URL will look something like: `http://<jenkins-server-ip>:8080//github-webhook/`
1. Leave other settings as default and create webhook
