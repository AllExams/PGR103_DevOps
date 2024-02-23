variable "docker_username" {
  description = "Docker Hub brukernavn"
}

variable "docker_password" {
  description = "Docker Hub passord"
  sensitive   = true
}

variable "repository_name" {
  description = "Navn på Docker Hub-repository"
}
