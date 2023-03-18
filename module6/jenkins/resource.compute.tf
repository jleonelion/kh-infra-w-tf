resource "aws_instance" "jenkins" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.ssh_key.id
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  user_data = <<-EOF
  #!/bin/bash
  # script should fail on error
  set -e
  # update and install java
  sudo apt-get update
  sudo apt-get install -y default-jre

  # configure jenkins repo and install package
  wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
  sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
  # rerun update to ingest new package repo
  sudo apt-get update && sudo apt-get install -y jenkins

  # configure terraform repo and install package
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
  sudo apt-add-repository --yes "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  sudo apt-get update && sudo apt-get install -y terraform
  EOF

  tags = {
    Name = "jenkins"
  }

  volume_tags = {
    Name = "jenkins"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
resource "aws_key_pair" "ssh_key" {
  key_name   = "jenkins"
  public_key = data.local_file.public_key.content
}
# https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file
data "local_file" "public_key" {
  filename = "${path.module}/jenkins_rsa.pub"
}

