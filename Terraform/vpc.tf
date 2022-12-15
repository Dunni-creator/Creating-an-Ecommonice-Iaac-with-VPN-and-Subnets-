# terraform Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  #cidr_block = "${var.vpc-cidr}"
  instance_tenancy = "default"
  enable_dns_hostname = true

  tags = {
    Name = "Test VPC"
  }
}



# Create internet Gateway an attach it to VPC
# trerraform aws create internet gateway

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id     = aws_vpc.vpc.id

  tags = {
    Name = "Test IGW"

 }
# Create a public subnet 1
resource "aws_subnet" "public-sub-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"
  #cidr_block = "${public-subnet-1-cidr}"
  availbaility_zone = "eu-north-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 1"
  }
 }
}

# Create a public subnet 2
resource "aws_subnet" "public-sub-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availbaility_zone = "eu-north-1b"
  #cidr_block = "${public-subnet-2-cidr}"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 2"
     }
 }




# Create a rount Table and Add public Rount.
# trerraform aws create route table.

resource "aws_route_table" "public-route-table" {
  vpc_id     = aws_vpc.vpc.id

  route = {
    cird_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id

  }
 

  tags = {
    Name = "public-Rount Table"
  }
}

# Associate Public Subnet 1 to "Public Rount Table"
# terraform aws associate subnet with rount table
resource "aws_route_table_assocation" "public-sub-net-1-rounte-assocation" {
   subnet_id      = aws_subnet.public-subnet-1.id
   route_table_id = aws_route_table.public-route-table.id

  }
     

# Associate Public Subnet 2 to "Public Rount Table"
# terraform aws associate subnet with rount table
resource "aws_route_table_assocation" "public-sub-net-2-rounte-assocation" {
   subnet_id      = aws_subnet.public-subnet-2.id
   route_table_id = aws_route_table.public-route-table.id

  }
         


# Create a private subnet 1
resource "aws_subnet" "private-sub-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  #cidr_block = "${private-subnet-1-cidr}"
  availbaility_zone = "eu-north-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 1 | App  Tier"
  }
 }


 # Create a private subnet 2
resource "aws_subnet" "private-sub-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.3.0/24"
  #cidr_block = "${private-subnet-1-cidr}"
  availbaility_zone = "eu-north-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 2 | App  Tier"
  }
 }

 # Create a private subnet 3
resource "aws_subnet" "private-sub-3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.4.0/24"
  #cidr_block = "${private-subnet-1-cidr}"
  availbaility_zone = "eu-north-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 3 | Database Tier"
  }
 }


 # Create a private subnet 4
resource "aws_subnet" "private-sub-4" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.5.0/24"
  #cidr_block = "${private-subnet-4-cidr}"
  availbaility_zone = "eu-north-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 4 | Database Tier"
  }
 }
