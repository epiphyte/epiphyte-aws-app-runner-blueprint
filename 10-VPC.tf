/*
Copyright (c) 2021-2022 Epiphyte LLC

Author: Fernandez-Alcon, Jose
E-mail: jose@epiphyte.io
*/

/* Main VPC
Subnets:
10.30.100.XXX - Public Subnet
10.30.1.XXX - Availability Zone Green
10.30.2.XXX - Availability Zone Blue
*/
resource "aws_vpc" "VPC" {
  cidr_block = "10.30.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
    PROJ = var.PROJ
    CONTACT = var.CONTACT
    STATUS = var.STATUS
  }
}



// Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = "10.30.100.0/24"
  map_public_ip_on_launch = true

  tags = {
    PROJ = var.PROJ
    CONTACT = var.CONTACT
    STATUS = var.STATUS
  }
}


//Define internet gateway for the VPC
resource "aws_internet_gateway" "VPC-GW" {
  vpc_id = aws_vpc.VPC.id

  tags = {
    PROJ = var.PROJ
    CONTACT = var.CONTACT
    STATUS = var.STATUS
  }
}


//Main route table for the VPC
resource "aws_route_table" "VPC-RT" {
  vpc_id = aws_vpc.VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.VPC-GW.id
  }
  tags = {
    PROJ = var.PROJ
    CONTACT = var.CONTACT
    STATUS = var.STATUS
  }
}


//Associate the GW route with the subnet the we want to allow to access the internet.
resource "aws_route_table_association" "route_ass_public" {
  depends_on = [aws_subnet.public_subnet ]

  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.VPC-RT.id
}