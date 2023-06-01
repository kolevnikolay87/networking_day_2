### ELASTIC IPs ###
resource "aws_eip" "eip_01" {
  domain           = "vpc"
}

resource "aws_eip" "eip_02" {
  domain           = "vpc"
}


### Internet GATEWAY ###
resource "aws_internet_gateway" "igw-01" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main_gw"
  }
}


### NAT Gateways ###
resource "aws_nat_gateway" "nat_gw_01" {
  allocation_id = aws_eip.eip_01.id
  subnet_id     = aws_subnet.subnet_public_1a.id

  tags = {
    Name = "gw_NAT_01"
  }
}

resource "aws_nat_gateway" "nat_gw_02" {
  allocation_id = aws_eip.eip_02.id
  subnet_id     = aws_subnet.subnet_public_1b.id

  tags = {
    Name = "gw_NAT_02"
  }
}