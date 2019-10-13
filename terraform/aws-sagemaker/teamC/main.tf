module "sagemaker" { 
    source = "github.com/eduever/devops.git//terraform/aws-sagemaker/sagemaker?ref=v0.0.1"
    sg_notebook_name = "teamC-sg"
    sg_notebook_instance = "ml.t2.medium"
    sg_notebook_role = "arn:aws:iam::175546642044:role/service-role/AmazonSageMaker-ExecutionRole-20190915T161542"
}
