variable "instance_db_name" {
  default = "alief-wordpress-db"
}

variable "instance_db_ip" {
  default = "10.37.37.120"
}

variable "mysql_host" {
  default = "10.37.37.120"
}

variable "mysql_port" {
  default = "3306"
}

variable "mysql_username" {
  default = "user_db"
}

variable "mysql_password" {
  default = "rahasia"
}

variable "mysql_database" {
  default = "wordpress"
}

variable "docker_container_name" {
  default = "alief-wordpress"
}

variable "image" {
  default = "ubuntu-18.04-server-cloudimg-amd64"
}

variable "private_key_path" {
  default = "/latihan/quiz2/deploywordpress/file/id_rsa"
}

variable "flavor" {
  default = "ns.2-2-20"
}

variable "keypair" {
  default = "key-alief"
}

variable "network" {
  default = "4dae7600-0c8a-4349-ad6b-491ef32fe7ce"
}

