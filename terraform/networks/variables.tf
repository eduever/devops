variable "mysql_root_password" {
  description = "The MySQL root password."
  default     = "Terraform@123"
}

variable "ghost_db_username" {
  description = "Ghost blog database username."
  default     = "root"
}

variable "ghost_db_name" {
  description = "Ghost blog database name."
  default     = "ghost_db"
}

variable "mysql_network_alias" {
  description = "The network alias for MySQL."
  default     = "mysql_nw"
}

variable "ghost_network_alias" {
  description = "The network alias for Ghost"
  default     = "ghost_nw"
}

variable "ext_port" {
  description = "Public port for Ghost Blog"
  default     = "8082"
}