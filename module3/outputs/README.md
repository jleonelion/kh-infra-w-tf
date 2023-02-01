# Reading Outputs Across State Files

This section demonstrates how to read outputs across different TF state files with a simple example.

## Apply Project1

Apply the first project to generate a state file with outputs

```bash
cd ./project1
terraform init
terraform apply --auto-approve
```

## Apply Project2

Now apply the second project and it will read outputs from the first project using `terraform_remote_state`

```bash
cd ../project2
terraform init
terraform apply --auto-approve
```
