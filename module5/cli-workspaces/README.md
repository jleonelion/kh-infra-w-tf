# Workspaces

In this excercise we will experiment with Terraform CLI Workspaces

## Deploy Sample Project in different Workspaces

Deploy the Terraform project in the [start](./start/) directory

```bash
export AWS_REGION="us-west-1"
terraform init
terraform apply --auto-approve
```

Examine the current workspace and create a new one

```bash
terraform workspace list
terraform workspace new test
terraform workspace list
```

Notice that init reuses previously downloaded providers and apply creates new s3

```bash
terraform init
terraform apply --auto-approve
```

Destroy the resources, switch out of the `test` workspace, then delete it.

```bash
terraform destroy
terraform workspace select default
terraform workspace delete test
```

## Deploy Sample Project in different statefiles (same workspace)

Deploy the Terraform project in the [start](./start/) directory

```bash
export AWS_REGION="us-west-1"
terraform init
terraform apply --auto-approve
```

Apply project, specifying alternate state file name

```bash
terraform apply --auto-approve -state test.tfstate
terraform destroy --auto-approve -state test.tfstate
```

Try alternate approach by reconfiguring backend values during init

```bash
terraform init -reconfigure -backend-config="path=override.tfstate"
terraform destroy --auto-approve
```
