provider "aws" {
  region = "${var.aws_region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

module "dynamo_table" { 
    source = "https://github.com/eduever/devops.git//devops/terraform/aws-sagemaker/sagemaker/?ref=master"
    sg_notebook_name = "teamA-sg"
    sg_notebook_instance = "ml.t2.medium"
    sg_notebook_role = "arn:aws:iam::175546642044:role/service-role/AmazonSageMaker-ExecutionRole-20190915T161542"
}
