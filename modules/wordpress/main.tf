resource "docker_image" "wordpress" {
  name = "wordpress"
}

resource "docker_container" "wordpress" {
  name = "${var.docker_container_name}"
  image = "${docker_image.wordpress.latest}"
  env = ["db_username=${var.mysql_username}", "db_password=${var.mysql_password}","db_host=${var.mysql_host}", "db_port=${var.mysql_port}", "db_database=${var.mysql_database}"]
  must_run="true"

  ports {
    internal = 80
    external = 8080
  }
}

