output "sg_notebook_id" {
  value = "${module.sagemaker.sp_notebook_name}"
}

// output "sg_notebook_arn" {
//   value = "${module.sagemaker.sp_notebook_resource_number}"
// }