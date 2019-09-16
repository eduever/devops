provider "aws" {
  region = "${var.aws_region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

module "dynamo_table" { 
    source = "https://github.com/eduever/devops.git//devops/terraform/aws-sagemaker/sagemaker/?ref=master"
    
}
