module "server_sg_name" {
  source = "./module/naming"

  app_abbrev  = var.prefix
  name        = "server"
  region      = var.region
  environment = var.environment
  type        = "aws_security_group"
}

module "server-sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "~> 4.17.1"

  name        = module.server_sg_name.result
  description = "Allow ssh and http inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  # ammend ingress rules to allow ssh too
  ingress_rules = ["ssh-tcp"]
}

module "alb_sg_name" {
  source = "./module/naming"

  app_abbrev  = var.prefix
  name        = "alb"
  region      = var.region
  environment = var.environment
  type        = "aws_security_group"
}

module "alb-sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "~> 4.17.1"

  name        = module.alb_sg_name.result
  description = "Allow inbound http traffic"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}
