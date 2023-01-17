# Variables

This directory contains example Terraform demonstrating the different types of variables (input variables, locals, and outputs).

## Excercises

### init

Before you run this simple Terraform project, you must init

```bash
terraform init
```

### apply

Apply the project to see the outputs produced using default values

```bash
terraform apply --auto-approve
```

### Override defaults with tfvars

Override defaults by applying with a tfvars file

```bash
terraform apply -var-file ./dev.tfvars
```

### Override defaults with environment variable

Override defaults by defining an environment variable

```bash
export TF_VAR_qty=5
terraform apply
```

### Override defaults with both environment variable and tfvars

Override defaults by defining and environment variable and using tfvars file to see tfvars gets precedence

```bash
export TF_VAR_qty=5
terraform apply -var-file ./dev.tfvars
```

## Create your own TFVars

Create a `qa.tfvars` file and override values for `instance_type` and `vpc_config`.  Refer to the [solution file](./end/qa.tfvars) if you get stuck.
