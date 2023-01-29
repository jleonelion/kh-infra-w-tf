# Refactoring Excercise

In this activity we will refactor the "Simple AWS IaaS Solution" Terraformed in a prior module.  In particular, we want to incorporate the following modules:

1. Use [vpc module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest) to create the VPC resources in our solution
1. Use [security-group module](https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest) to create the security groups that are part of the solution.

## Before you Begin

Don't forget to copy the public SSH key, the one we create in [module2/iaas](../../module2/iaas/), into the working directory of the Terraform project.

```bash
# now copy the public key into a file location that Terraform expects the file to be
cp ~/.ssh/ec2_rsa.pub ec2_rsa.pub
```
