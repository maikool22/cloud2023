variable "ami" {
    description = "Ami ID"
    type = string    
}

variable "instance_type" {
    description = "Tipo instancia"
    type = string
}

variable "key_name" {
    type = string  
}

variable "name_instance" {
    type = string  
}

output "dns" {
    value = aws_instance.web-terraform-instance.public_dns  
}