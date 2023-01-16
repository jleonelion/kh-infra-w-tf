# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
# resource "aws_lb" "front_end" {
#   name               = "front-end"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.alb.id]
#   subnets            = [aws_subnet.public_a.id, aws_subnet.public_a.id]
#   # subnets = [aws_subnet.public.id]

#   enable_deletion_protection = false
# }
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
# resource "aws_lb_target_group" "front_end" {
#   name        = "front-end"
#   target_type = "alb"
#   port        = 80
#   protocol    = "TCP"
#   vpc_id      = aws_vpc.main.id
# }
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
# resource "aws_alb_listener" "front_end" {
#   load_balancer_arn = aws_lb.front_end.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.front_end.arn
#   }
# }
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment
# resource "aws_alb_target_group_attachment" "server1" {
#   target_group_arn = aws_lb_target_group.front_end.arn
#   target_id        = aws_instance.server1.id
#   port             = 80
# }
# # resource "aws_alb_target_group_attachment" "server2" {
# #   target_group_arn = aws_alb_target_group.front_end.arn
# #   target_id        = aws_instance.server2.id
# #   port             = 80
# # }

# # resource "aws_lb_target_group" "target_group" {
# #   for_each = local.target_groups

# #   vpc_id = var.vpc_id

# #   port = each.value.port
# #   protocol = each.value.protocol

# #   target_type = each.value.target_type

# #   deregistration_delay = each.value.deregistration_delay

# #   health_check {
# #     path = each.value.health_check.path
# #     port = each.value.health_check.port
# #     protocol = each.value.health_check.protocol
# #     interval = each.value.health_check.interval
# #     healthy_threshold = each.value.health_check.healthy_threshold
# #     unhealthy_threshold = each.value.health_check.unhealthy_threshold
# #   }

# #   tags = {
# #     Name = "${var.component}-${var.deployment_identifier}-${each.value.port}-${each.value.protocol}"
# #     Component = var.component
# #     DeploymentIdentifier = var.deployment_identifier
# #   }

# #   # this dependency is required to ensure the target group has an LB before it
# #   # can be used by a dependent
# #   depends_on = [
# #     aws_lb.load_balancer
# #   ]
# # }
