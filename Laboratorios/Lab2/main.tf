resource "aws_instance" "Lab2-instance" {
  ## las variables vacias las voy a parametrizar en el variables.tf
  ## las llamo con el var.nombre de la variable
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = var.aws_security_group
  tags = {
    Name =  var.Name
  }
}