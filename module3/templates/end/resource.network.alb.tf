module "lb_name" {
  source = "./module/naming"

  app_abbrev  = var.prefix
  name        = "front-end"
  region      = var.region
  environment = var.environment
  type        = "aws_lb"
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
resource "aws_lb" "front_end" {
  name               = module.lb_name.result
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.alb-sg.security_group_id]
  # subnets            = [aws_subnet.public_a.id, aws_subnet.public_c.id]
  subnets = module.vpc.public_subnets


  enable_deletion_protection = false
}

module "tg_name" {
  source = "./module/naming"

  app_abbrev  = var.prefix
  name        = "front-end"
  region      = var.region
  environment = var.environment
  type        = "aws_lb_target_group"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
resource "aws_lb_target_group" "front_end" {
  name     = module.tg_name.result
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment
resource "aws_alb_target_group_attachment" "server" {
  count = var.num_web_servers

  target_group_arn = aws_lb_target_group.front_end.arn
  target_id        = aws_instance.server[count.index].id
  port             = 80
}
