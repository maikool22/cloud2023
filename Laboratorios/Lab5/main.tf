module "ejemplo-clase" {
    source = "./modules/ejemplo-clase"
    ami = "ami-0889a44b331db0194"
    instance_type = "t2.micro"
    key_name = "vockey"
    name_instance = "Instancia-desde-module"      
}

output "dns-output" {
    value = module.ejemplo-clase.0.public_dns  
}
