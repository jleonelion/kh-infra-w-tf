output "server1_public_ip" {
  value = aws_instance.server1.public_ip
}

# output "server2_public_ip" {
#   value = aws_instance.server2.public_ip
# }

# output "alb_dns_name" {
#   value = aws_lb.front_end.dns_name
# }
