// this example is for Ghost blog & nginx
#Define variables

variable "env" {
  description = "ENTER env: dev or prod ONLY"
}

variable "image_name" {
  type         = "map"
  description = "Image for container."
  default     = {
    dev  = "nginx:latest"
    prod = "ghost:alpine"
  }
}

variable "container_name" {
  type        = "map"
  description = "Name of the container."
  default     = {
    dev  = "nginx_dev"
    prod = "blog_prod"
  }
}

variable "ext_port" {
  type        = "map"
  description = "External port for container."
  default     = {
    dev  = "3000"
    prod = "8000"
  }
}

variable "int_port" {
  type        = "map"
  description = "Internal port for container."
  default     = {
    dev  = "80"
    prod = "2368"
  }
}
~          