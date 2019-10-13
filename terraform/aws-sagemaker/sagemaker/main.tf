provider "aws" {
  region = "${var.aws_region}"
  shared_credentials_file = "/home/cloud_user/.aws/credentials"
  profile                 = "admin"
  }
 
resource "aws_sagemaker_notebook_instance" "notebook" {
  name                  = "${var.sg_notebook_name}"
  role_arn              = "${var.sg_notebook_role}"
  instance_type         = "${var.sg_notebook_instance}"
}