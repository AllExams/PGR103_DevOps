provider "dockerhub" {
  username = var.docker_username
  password = var.docker_password
}

resource "dockerhub_repository" "project" {
  name        = var.repository_name
  namespace   = var.docker_username
  description = "Configure repositories"
}
