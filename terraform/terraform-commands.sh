terraform init

terraform plan -out=nginx_plan

terraform apply nginx_plan

terraform plan -out=blog_plan -var 'container_name=ruthwik_blog1' -var 'image_name=ghost:alpine' -var 'ext_port=8080'

terraform state list

terraform destroy

terraform destroy -target <RESOURCETYPE.NAME>

#when you have multiple workspaces created 

terraform workspace new prod

# note: when u r in prod workspace you can not try to destroy dev wkspace contents. you need to switch workspace.

terraform workspace select dev

terraform plan -out=tfprod_plan -var 'env=prod'
terraform apply tfprod_plan

