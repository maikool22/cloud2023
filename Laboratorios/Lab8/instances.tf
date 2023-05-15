resource "aws_instance" "webapp-server01" {
  ami                    = "ami-02396cdd13e9a1257"
  instance_type          = "t2.large"
  key_name               = "vockey"
  vpc_security_group_ids = [aws_security_group.ssh-http-access.id]
}

resource "aws_instance" "webapp-server02" {
  ami                    = "ami-02396cdd13e9a1257"
  instance_type          = "t2.large"
  key_name               = "vockey"
  vpc_security_group_ids = [aws_security_group.ssh-http-access.id]
}