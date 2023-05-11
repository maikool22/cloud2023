resource "aws_instance" "web-terraform-instance" {
  instance_type = var.instance_type
  ami = var.ami 
  key_name = var.key_name
  tags = {
    Name = var.name_instance
  }
}