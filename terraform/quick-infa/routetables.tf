provider "aws" {
  region = var.aws_region
}

############# ROUTE TABLES ####################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    env = "test"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    env = "test"
  }
}

############# ROUTE TABLE ASSOICATIONS ####################

resource "aws_route_table_association" "public_rt_ass" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_rt_ass" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

