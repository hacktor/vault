storage "file" {
  path = "/data/vault"
}

ui = true
disable_mlock = 1

listener "tcp" {
  address     = "0.0.0.0:8200"
#  tls_cert_file = "/etc/vault.d/server.crt"
#  tls_key_file  = "/etc/vault.d/server.key"
  tls_disable = 1
}

