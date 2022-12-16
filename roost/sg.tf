resource "aws_security_group" "sg_eaas_instances" {
  name        = "sg_eaas_instances"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "SSH port"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    //security_groups = [aws_security_group.sg_eaas_jumphost.id]
  }
  ingress {
    description      = "https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    //security_groups = [aws_security_group.sg_eaas_loadbalancer.id]
  }
  ingress {
    description      = "Docker host"
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    //security_groups = [aws_security_group.sg_eaas_instances.id]
  }
  ingress {
    description      = "Docker Insecure Registry"
    from_port        = 5002
    to_port          = 5002
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    //security_groups = [aws_security_group.sg_eaas_instances.id]
  }
    ingress {
    description      = "Jumphost RoostAPIServer"
    from_port        = 60001
    to_port          = 60001
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    //security_groups = [aws_security_group.sg_eaas_instances.id]
    }
  ingress {
    description      = "RoostCluster Launch"
    from_port        = 60002
    to_port          = 60002
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    //security_groups = [aws_security_group.sg_eaas_instances.id]
  }
  ingress {
    description      = "EaaS API Server"
    from_port        = 60003
    to_port          = 60003
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    //security_groups = [aws_security_group.sg_eaas_instances.id]
  }
  ingress {
    description      = "Cypress Video Server"
    from_port        = 60005
    to_port          = 60005
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    //security_groups = [aws_security_group.sg_eaas_instances.id]
  }

ingress {
    description      = "Web-console(gotty)"
    from_port        = 60006
    to_port          = 60006
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    //security_groups = [aws_security_group.sg_eaas_instances.id]
}
ingress {
    description      = "Dynamic gotty-ports"
    from_port        = 62020
    to_port          = 62120
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    //security_groups = [aws_security_group.sg_eaas_instances.id]
  }
egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
  tags = {
    Project = local.project
    Name = join("-",[var.prefix, var.company_name, "instances"])
  }
}

resource "aws_security_group" "sg_eaas_loadbalancer" {
  name        = "sg_eaas_loadbalancer"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description      = "https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Project = local.project
    Name = join("-",[var.prefix, var.company_name, "loadbalancer"])
  }
}
# resource "aws_security_group" "sg_eaas_database" {
#   name        = "sg_eaas_database"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.vpc.id
#   ingress {
#     description      = "ssh"
#     from_port        = 3306
#     to_port          = 3306
#     protocol         = "tcp"
#     cidr_blocks      = [aws_vpc.vpc.cidr_block]
#     security_groups = [aws_security_group.sg_eaas_instances.id]
#   }
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
#   tags = {
#     Project = local.project
#     Name = join("-",[var.prefix, var.company_name, "database"])
#   }
# }
resource "aws_security_group" "sg_eaas_jumphost" {
  name        = "sg_eaas_jumphost"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description      = "SSH port"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Project = local.project
    Name = join("-",[var.prefix, var.company_name, "jumphost"])
  }
}