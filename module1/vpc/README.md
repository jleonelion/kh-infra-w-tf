# Provision Your First AWS VPC

In this section, you will run Terraform to provision a basic VPC.  You will learn more about the Terraform code throughout the course.  The important points for this sections are that you successfully:

* Configure AWS account authentication
* Initialize and Apply the Terraform configuration in this directory
* Verify success with manual inspection through management console

## AWS Credentials

Terraform expects your AWS credentials to be provided in specific environment variables.  You need to have access to IAM Managment Console to retrieve information about the API user account that Terraform will execute as.

Set environmenht variables to reflect the authn credentials

```bash
export AWS_ACCESS_KEY_ID=<insert>
export AWS_SECRET_ACCESS_KEY=<insert>
```

## AWS Region

You also need to specify the AWS Region that the resource will be created in.  See list of [AWS Regions](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html#Concepts.RegionsAndAvailabilityZones.Regions) or use the default value in below example.

```bash
export AWS_REGION="us-west-2"
```

## Run Terraform

With current working directory in the same directory as this README file

```bash
terraform init
terraform apply
```

Enter "yes" to complete, then view VPC Management console:

*Don't forget to cleanup!*

```bash
terraform destroy
```