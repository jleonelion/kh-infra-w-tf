resource "aws_instance" "server1" {
  ami             = data.aws_ami.server_ami.id
  instance_type   = "t2.micro"
  key_name        = "install" # aws_key_pair.ssh_key.id
  subnet_id       = aws_subnet.public_a.id
  security_groups = [aws_security_group.server.id]

  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y && sudo apt install -y nginx
  echo "Hello World from $(hostname -f)" > /var/www/html/index.html
  EOF

  tags = {
    Name = "server1"
  }

  volume_tags = {
    Name = "server1"
  }
}

# resource "aws_key_pair" "ssh_key" {
#   key_name   = "ssh-key"
#   public_key = file("~/.ssh/${var.aws_key_name}.pub")
# }
