  
resource "aws_sagemaker_notebook_instance" "basic" {
  name                  = "${var.sg_notebook_name}"
  role_arn              = "${var.sg_notebook_role}"
  instance_type         = "${var.sg_notebook_instance}"
}