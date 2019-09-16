variable "aws_region" {
    default = "us-west-2"
} */

#----networking/variables.tf----
variable "vpc_cidr" {}

variable "public_cidrs" {
  type = "list"
}

variable "accessip" {}
