resource "docker_image" "nginx_image" {
    name = "nginx:latest"
}

// ===========

# terraform with variables.

variable "image_name" {
  description = "Image for container."
  default     = "ghost:latest"
}

variable "container_name" {
  description = "Name of the container."
  default     = "ghost_blog"
}

variable "ext_port" {
  description = "External port for container."
  default     = "80"
}

# Download the latest Ghost Image
resource "docker_image" "ghost_image" {
  name = "${var.image_name}"
}

resource "docker_container" "ghost_container" {
  name  = "${var.container_name}"
  image = "${docker_image.ghost_image.latest}"
  ports {
    internal = "2368"
    external = "${var.ext_port}"
  }
}


// this example is for Ghost blog & nginx
# terraform with maps & workspace and variables.tf file created.

# Download the latest  Image using Interpolation syntx ($lookup)

resource "docker_image" "image_id" {
  name = "${lookup(var.image_name, var.env)}"
}

# Start the Container

resource "docker_container" "container_id" {
  name  = "${lookup(var.container_name, var.env)}"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "${lookup(var.int_port, var.env)}"
    external = "${lookup(var.ext_port, var.env)}"
  }
}


