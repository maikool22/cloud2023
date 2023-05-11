resource "aws_instance" "Lab1-instance" {
  ## las variables vacias las voy a parametrizar en el variables.tf
  ## las llamo con el var.nombre de la variable
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name =  var.Name
  }
}