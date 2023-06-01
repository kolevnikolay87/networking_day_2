### SUBNETS ###
resource "aws_subnet" "subnet_public_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_public_1a_01
  availability_zone = var.availability_zone_1a

  tags = {
    Name = "subnet_public_1a"
  }
}

resource "aws_subnet" "subnet_public_1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_public_1b_02
  availability_zone = var.availability_zone_1b

  tags = {
    Name = "subnet_public_1b"
  }
}

resource "aws_subnet" "subnet_private_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_private_1a_03
  availability_zone = var.availability_zone_1a

  tags = {
    Name = "subnet_private_1a"
  }
}

resource "aws_subnet" "subnet_private_1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_private_1b_04
  availability_zone = var.availability_zone_1b

  tags = {
    Name = "subnet_private_1b"
  }
}