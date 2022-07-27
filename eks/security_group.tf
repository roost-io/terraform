resource "aws_default_subnet" "eks_subnet_a" {
  availability_zone = "ap-south-1b"
}

resource "aws_default_subnet" "eks_subnet_b" {
  availability_zone = "ap-south-1c"
}

resource "aws_default_vpc" "eks_vpc" {
  tags = {
    Name = "default"
  }
}

/*
resource "aws_security_group" "eks_security_group" {
  name        = "eks_security_group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.eks_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_default_vpc.eks_vpc.cidr_block]
    ipv6_cidr_blocks = [aws_default_vpc.eks_vpc.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # tags = {
  #   Name = "${var.eaas_app_name}/${var.eaas_namespace}/default_vpc"
  # }
}
*/