#!/bin/bash

wget -O ./vault.zip https://releases.hashicorp.com/vault/1.3.2/vault_1.3.2_linux_amd64.zip
unzip ./vault.zip

newcontainer=$(buildah from scratch)

buildah config --created-by "HackTor IT"  $newcontainer
buildah config --author "Ruben de Groot" --label name=nagiospod $newcontainer

buildah copy $newcontainer ./vault /bin/vault
buildah copy $newcontainer ./vault.hcl /etc/vault.hcl
buildah config --port 8200 $newcontainer
buildah config --entrypoint '[ "/bin/vault", "server", "-config=/etc/vault.hcl" ]' $newcontainer
buildah commit $newcontainer vault:latest

