output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "jenkins_ssh" {
  value = "ssh -i ~/.ssh/jenkins_rsa ubuntu@${aws_instance.jenkins.public_ip}"
}

output "jenkins_url" {
  value = "http://${aws_instance.jenkins.public_ip}:8080"
}
