#! /bin/bash

# sanity check to make sure this is run as root
if [ "$(id -u)" -ne 0 ]; then echo "Please run as root." >&2; exit 1; fi

# exit on any error
set -e

# define specific version to install
TF_VERSION=1.3.6
TF_ARCH=amd64
TARGET_OS=linux

echo "Downloading Terrform: ${TF_VERSION}_${TARGET_OS}_${TF_ARCH} into /tmp"
curl -sSL -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_${TARGET_OS}_${TF_ARCH}.zip

echo "Extracting archive into /usr/local/bin"
unzip -d /usr/local/bin /tmp/terraform.zip

echo "Setting executable bit"
chmod +x /usr/local/bin/terraform

echo "Cleaning up /tmp"
rm /tmp/terraform.zip