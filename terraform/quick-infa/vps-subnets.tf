############# VPC ####################
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  enable_classiclink   = "false"
  instance_tenancy     = "default"
  tags = {
    env = "test"
  }
}

############# SUBNETS ####################

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = var.public_az
  tags = {
    env = "test"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnets
  map_public_ip_on_launch = "false" //it makes this a public subnet
  availability_zone       = var.private_az
  tags = {
    env = "test"
  }
}

############# IG ####################


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    env = "test"
  }
}
