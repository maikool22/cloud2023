resource "aws_security_group" "lab2-security-group" {
    name = "allow_ssh"
    description = "Permito trafico SSH"
    vpc_id = "aws_vpc.main.id" 

    ingress {
        description = "Permito trafico ssh entrante"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    } 

    egress = {
        description = "Trafico trafico saliente"
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]        
    }
    #NOTA#
    # Setting protocol = "all" or protocol = -1 with from_port and to_port
    # will result in the EC2 API creating a security group rule with all ports open.
    # This API behavior cannot be controlled by Terraform and may generate warnings in the future.
}

