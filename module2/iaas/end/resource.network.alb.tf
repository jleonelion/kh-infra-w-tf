# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
resource "aws_lb" "front_end" {
  name               = "${var.prefix}-front-end"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [aws_subnet.public_a.id, aws_subnet.public_c.id]
  # subnets = [aws_subnet.public.id]

  enable_deletion_protection = false
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
resource "aws_lb_target_group" "front_end" {
  name     = "${var.prefix}-front-end"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
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
resource "aws_alb_target_group_attachment" "server1" {
  target_group_arn = aws_lb_target_group.front_end.arn
  target_id        = aws_instance.server1.id
  port             = 80
}
resource "aws_alb_target_group_attachment" "server2" {
  target_group_arn = aws_lb_target_group.front_end.arn
  target_id        = aws_instance.server2.id
  port             = 80
}
