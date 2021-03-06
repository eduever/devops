variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.20.0.0/16"
}

variable "private_subnets" {
  type    = "string"
  default = "10.20.1.0/24"
}

variable "public_subnets" {
  type    = "string"
  default = "10.20.2.0/24"
}

variable "public_az" {
  type    = "string"
  default = "us-east-1a"
}


variable "private_az" {
  type    = "string"
  default = "us-east-1b"
}

variable "instance_type" {
  type    = "string"
  default = "t2.micro"
}

variable "public_key_path" {
  type    = "string"
  default = "/home/cloud_user/.ssh/id_rsa.pub"
}


# export AWS_ACCESS_KEY_ID=
# export AWS_SECRET_ACCESS_KEY=
