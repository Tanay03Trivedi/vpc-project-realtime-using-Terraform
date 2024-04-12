# VPC
resource "aws_vpc" "project" {
  cidr_block = "10.0.0.0/16"
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.project.id
}

# Public Subnets
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.project.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.project.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
}

# Route Tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

# Private Subnets
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.project.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.project.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-south-1b"
}

# NAT Gateway
resource "aws_eip" "nat" {}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public1.id
}

# Route Table for Private Subnets
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.project.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}



