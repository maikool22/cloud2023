#1 - Creamos la vpc
resource "aws_vpc" "vpc-practico-3tier" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-practico-3tier"
  }
}
#2 - creamos las subnets
resource "aws_subnet" "subnet1-practico-3tier" {
  vpc_id                  = aws_vpc.vpc-practico-3tier.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet1-practico-3tier"
  }

}

resource "aws_subnet" "subnet2-practico-3tier" {
  vpc_id                  = aws_vpc.vpc-practico-3tier.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet2-practico-3tier"
  }

}

resource "aws_internet_gateway" "inetgw-practico-3tier" {
  vpc_id = aws_vpc.vpc-practico-3tier.id
  tags = {
    Name = "inetgw-practico-3tier"
  }
}

resource "aws_route_table" "route-table-practico-3tier" {
  vpc_id = aws_vpc.vpc-practico-3tier.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.inetgw-practico-3tier.id
  }

}

resource "aws_lb" "ALB" {
  name               = "ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ssh-http-access.id]
  subnets            = [aws_subnet.subnet1-practico-3tier.id, aws_instance.webapp-server02.id]

  tags = {
    Name = "ALB"
  }


}
