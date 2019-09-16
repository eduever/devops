  
resource "aws_sagemaker_notebook_instance" "basic" {
  name                  = "${var.sg_notebook_name}"
  role_arn              = "${aws_iam_role.sm_notebook_instance_role.arn}"
  instance_type         = "ml.t2.medium"
  
}