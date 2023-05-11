resource "aws_security_group" "web-terraform-sg" {
  name   = "web-terraform-sg"
  vpc_id = "vpc-0b2f95970567b7c16"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}