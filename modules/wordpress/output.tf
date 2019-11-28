output "docker_container_name" {
  value       = "${docker_container.wordpress.*.name}"
  description = "Docker Container Name"
}

