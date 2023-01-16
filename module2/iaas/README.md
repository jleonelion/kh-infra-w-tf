# AWS IaaS Sample

This terraform code creates a simple IaaS solution in AWS.  We put two EC2 webservers behind a load balancer that is exposed to the public internet.  We also expose SSH to one of the servers.

## Setup

Configure [AWS credentials file](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
```bash
aws configure
# enter your secret id and secret key
```

Generate a key pair that will be used to access the servers
