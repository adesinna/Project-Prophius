resource "docker_registry_repository" "my_private_repo" {
  name       = "adesinna/prophius"
  provider   = docker.registry
  visibility = "private"
}