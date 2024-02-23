provider "docker" {
  # Konfigurer Docker-provideren her om nødvendig
}

resource "dockerhub_repository" "project" {
  name        = env("REPOSITORY_NAME")
  namespace   = env("DOCKER_USERNAME")
  description = "PGR-301"
  password    = env("DOCKER_PASSWORD")
}

