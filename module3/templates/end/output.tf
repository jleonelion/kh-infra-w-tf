output "server_ssh" {
  value = [
    for index in range(var.num_web_servers) : "ssh -i ~/.ssh/ec2_rsa ubuntu@${aws_instance.server[index].public_ip}"
  ]
}

output "server_curl" {
  value = [
    for index in range(var.num_web_servers) : "curl http://${aws_instance.server[index].public_ip}"
  ]
}

output "alb_curl" {
  value = "curl http://${aws_lb.front_end.dns_name}"
}
