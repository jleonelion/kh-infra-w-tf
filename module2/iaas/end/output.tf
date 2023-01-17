output "server1_ssh" {
  value = "ssh -i ~/.ssh/ec2_rsa ubuntu@${aws_instance.server1.public_ip}"
}
output "server1_curl" {
  value = "curl http://${aws_instance.server1.public_ip}"
}

output "server2_ssh" {
  value = "ssh -i ~/.ssh/ec2_rsa ubuntu@${aws_instance.server2.public_ip}"
}
output "server2_curl" {
  value = "curl http://${aws_instance.server2.public_ip}"
}

output "alb_curl" {
  value = "curl http://${aws_lb.front_end.dns_name}"
}
