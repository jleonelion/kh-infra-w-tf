resource "aws_instance" "jenkins" {
  # ami             = "ami-005e54dee72cc1d00"
  ami             = "ami-0ceecbb0f30a902a6"
  instance_type   = var.instance_type
  key_name        = var.instance_key
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.sg.id]

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo yum update -y
  sudo yum install -y httpd.x86_64
  sudo systemctl start httpd.service
  sudo systemctl enable httpd.service
  echo "*** Completed Installing apache2"
  EOF

  tags = {
    Name = "jenkins"
  }

  volume_tags = {
    Name = "jenkins"
  }
}
