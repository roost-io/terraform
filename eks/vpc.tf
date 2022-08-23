resource "aws_default_vpc" "default" {
  tags = {
    Name = "default"
  }
}
resource "aws_default_subnet" "default_az1" {
  availability_zone = var.availability_zones.0
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = var.availability_zones.1
}