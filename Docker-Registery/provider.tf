terraform {
  required_providers {
    docker = {
      source  = "adesinna/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}