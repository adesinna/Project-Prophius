provider "docker" {
  host = "unix:///var/run/docker.sock"
}

provider "docker" {
  alias = "registry"

  registry_auth {
    address  = "https://index.docker.io/v1/"
  }
}
