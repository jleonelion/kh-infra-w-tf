# Remote Backend in S3 Bucket

In this activity you will deploy AWS infrastructure necessary to host Terraform state file in S3 bucket.  Then you will move the state file to the S3 bucket you deployed.

## Initial Deployment

Deploy the Terraform project in the [start](./start/) directory

```bash
export AWS_REGION="us-west-1"
terraform init
terraform apply --auto-approve
```

The S3 bucket will have a random name.  You can determine the name by looking at Terraform output.

## Update Backend Configuration

Update [backend.tf](./start/backend.tf) so backend is configured to store on S3 bucket. See [S3 backend documentation](https://developer.hashicorp.com/terraform/language/settings/backends/s3) for full details

```bash
terraform init -migrate-state
```

View the tf statefile in the AWS Console.

## Destroy

```bash
terraform destroy
```

This will fail b/c you have the state file stored in the bucket itself.  You must manually delete the bucket contents (and the bucket) using AWS CLI or console.
