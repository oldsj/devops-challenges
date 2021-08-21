#!/usr/bin/env sh
set -eux
mkdir /tmp/tf && cd /tmp/tf || exit
mv /tmp/hashi.asc .

curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip
curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_SHA256SUMS.sig
curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_SHA256SUMS
gpg --import hashi.asc
gpg --verify terraform_${TERRAFORM_VER}_SHA256SUMS.sig terraform_${TERRAFORM_VER}_SHA256SUMS
grep linux_amd64 terraform_${TERRAFORM_VER}_SHA256SUMS > terraform_${TERRAFORM_VER}_SHA256SUMS_linux_amd64
cat terraform_${TERRAFORM_VER}_SHA256SUMS_linux_amd64 | sha256sum -c - 
unzip terraform_${TERRAFORM_VER}_linux_amd64.zip
install terraform /usr/local/bin
terraform -install-autocomplete

cd /
rm -rf /tmp/tf
terraform -v

