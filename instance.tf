module "wordpress" {
  source                 = "/latihan/quiz2/deploywordpress/modules/wordpress"
  docker_container_name  = "${var.docker_container_name}"
  mysql_host             = "${var.mysql_host}"
  mysql_port             = "${var.mysql_port}"
  mysql_username         = "${var.mysql_username}"
  mysql_password         = "${var.mysql_password}"
  mysql_database         = "${var.mysql_database}"
}

module "db" {
  source                 = "/latihan/quiz2/deploywordpress/modules/db"
  instance_flavor        = "${var.flavor}"
  instance_image         = "${var.image}"
  instance_keypair       = "${var.keypair}"
  network_id             = "${var.network}"
  instance_name          = "${var.instance_db_name}"
  private_key_path       = "${var.private_key_path}"
  mysql_username         = "${var.mysql_username}"
  mysql_password         = "${var.mysql_password}"
  mysql_database         = "${var.mysql_database}"
  instance_int_address   = "${var.instance_db_ip}"
}

output "instance_db_name" {
  value       = "${module.db.instance_db_name}"
  description = "openstack instance name"
}

output "instance_db_floating_ip" {
  value       = "${module.db.instance_db_floating_ip}"
  description = "openstack instance floating ip"
}

output "docker_container_name" {
  value       = "${module.wordpress.docker_container_name}"
  description = "Docker Container Name"
}

