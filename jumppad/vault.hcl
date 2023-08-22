resource "container" "vault" {
  network {
    id = resource.network.local.id
  }

  image {
    name = "hashicorp/vault:1.13.3"
  }

  environment = {
    VAULT_ADDR = "http://localhost:8200"
    VAULT_DEV_ROOT_TOKEN_ID = "root"
  }

  port {
    local  = 8200
    remote = 8200
    host   = 8200
  }
}

