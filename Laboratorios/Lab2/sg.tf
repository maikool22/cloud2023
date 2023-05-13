resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Permito trafico ssh"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Ingress para ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
  #NOTA#
  # Setting protocol = "all" or protocol = -1 with from_port and to_port
  # will result in the EC2 API creating a security group rule with all ports open.
  # This API behavior cannot be controlled by Terraform and may generate warnings in the future.
}

