#----root/variables.tf-----
variable "aws_region" {
    default = "us-west-2"
}

variable "access_key" {
    default = "AKIAXZIBZ2IZQDAZZJ5N"
}

variable "secret_key" {
    default = "56pO78QazOVRAW1FfIEr2UIDNSbtvljiOSobg0Ih"
}

#------ storage variables
variable "project_name" {}

#-------networking variables
variable "vpc_cidr" {}

variable "public_cidrs" {
  type = "list"
}

variable "accessip" {}

#-------compute variables
variable "key_name" {}
variable "public_key_path" {}
variable "server_instance_type" {}
variable "instance_count" {
  default = 1
}