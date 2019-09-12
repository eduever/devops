resource "docker_image" "mysql_image" {
  name = "mysql:5.7"
}

resource "docker_image" "ghost_image" {
  name = "ghost:alpine"
}