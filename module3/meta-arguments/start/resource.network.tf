# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.19.0"

  name = local.vpc.name
  cidr = local.vpc.cidr

  azs            = local.vpc.azs
  public_subnets = local.vpc.public_subnets

  public_subnet_tags_per_az = local.vpc.public_subnet_tags_per_az

  tags = local.tags

  vpc_tags = local.vpc.tags
}
