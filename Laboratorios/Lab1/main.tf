resource "aws_instance" "Lab1-instance" {
  ## las variables vacias las voy a parametrizar en el variables.tf
  ami = ""
  instance_type = "" ## 
  key_name = ""
  tags = {
    Name =  ""
  }
}