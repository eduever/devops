/* variable "access_key" {
    default = "AKIAZP4YMQNQPCUUT26C"
}
variable "secret_key" {
    default = "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"
}

variable "aws_region" {
    default = "us-west-2"
} */

#----networking/variables.tf----
variable "vpc_cidr" {}

variable "public_cidrs" {
  type = "list"
}

variable "accessip" {}
