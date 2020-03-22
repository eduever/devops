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

resource "aws_instance" "ec2_instance" {
  instance_type = var.instance_type
  ami           = data.aws_ami.server.id
  tags = {
    env = "test"
  }
  key_name               = aws_key_pair.auth.key_name
  vpc_security_group_ids = aws_security_group.ssh_allowed.*.id
  subnet_id              = aws_subnet.public.id
}
