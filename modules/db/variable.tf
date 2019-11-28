variable "instance_int_address" {
  description = "instance internal address"
  type        = string
}

variable "instance_name" {
  description = "instance name"
  type        = string
}

variable "instance_flavor" {
  description = "instance flavor"
  type        = string
}

variable "instance_image" {
  description = "instance image"
  type        = string
}

variable "instance_keypair" {
  description = "instance keypair"
  type        = string
}

variable "network_id" {
  description = "network id"
  type        = string
}

variable "private_key_path" {
  description = "private key path"
  type        = string
}

variable "mysql_username" {
  description = "Mariadb User"
  type        = string
}

variable "mysql_password" {
  description = "Mariadb Password"
  type        = string
}

variable "mysql_database" {
  description = "Mariadb Database"
  type        = string
}

