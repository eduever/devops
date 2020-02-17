provider "aws" {
  region = var.aws_region
}
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

############# SECURITY GROUPS ####################

resource "aws_security_group" "ssh_allowed" {
  vpc_id = aws_vpc.vpc.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // This means, all ip address are allowed to ssh ! 
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    env = "test"
  }
}


############# KEY-PAIR ####################

# resource "tls_private_key" "example" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

resource "aws_key_pair" "auth" {
  key_name   = "aws_key"
  public_key = file(var.public_key_path)
}

############# EC2 INSTANCES ####################

data "aws_ami" "server" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }
}

resource "aws_instance" "tf_server" {
  instance_type = var.instance_type
  ami           = data.aws_ami.server.id
  tags = {
    env = "test"
  }
  key_name               = aws_key_pair.auth.key_name
  vpc_security_group_ids = aws_security_group.ssh_allowed.*.id
  subnet_id              = aws_subnet.public.id
}

