### ROUTING TABLES ###
resource "aws_route_table" "rt_pub_sub-01" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-01.id
  }

  tags = {
    Name = "routing_pub_sub-01"
  }
}
resource "aws_route_table_association" "pub_sub-01_assoc" {
  subnet_id      = aws_subnet.subnet_public_1a.id
  route_table_id = aws_route_table.rt_pub_sub-01.id
}

resource "aws_route_table" "rt_pri_sub-03" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw_01.id
  }

  tags = {
    Name = "routing_pri_sub-03"
  }
}
resource "aws_route_table_association" "pri_sub-03_assoc" {
  subnet_id      = aws_subnet.subnet_private_1a.id
  route_table_id = aws_route_table.rt_pri_sub-03.id
}

resource "aws_route_table" "rt_pub_sub-02" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-01.id
  }

  tags = {
    Name = "routing_pub_sub-02"
  }
}
resource "aws_route_table_association" "pub_sub-02_assoc" {
  subnet_id      = aws_subnet.subnet_public_1b.id
  route_table_id = aws_route_table.rt_pub_sub-02.id
}

resource "aws_route_table" "rt_pri_sub-04" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw_02.id
  }

  tags = {
    Name = "routing_pri_sub-04"
  }
}
resource "aws_route_table_association" "pri_sub-04_assoc" {
  subnet_id      = aws_subnet.subnet_private_1b.id
  route_table_id = aws_route_table.rt_pri_sub-04.id
}