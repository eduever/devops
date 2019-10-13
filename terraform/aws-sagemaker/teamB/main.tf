provider "aws" {
  region = "${var.aws_region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

module "sagemaker" { 
    source = "github.com/eduever/devops.git//terraform/aws-sagemaker/sagemaker?ref=v0.0.1"
    sg_notebook_name = "${var.sg-name}"
    sg_notebook_instance = "ml.t2.medium"
    sg_notebook_role = "arn:aws:iam::175546642044:role/service-role/AmazonSageMaker-ExecutionRole-20190915T161542"
}
