#! /bin/bash

# sanity check to make sure this is run as root
if [ "$(id -u)" -ne 0 ]; then echo "Please run as root." >&2; exit 1; fi

# exit on any error
set -e

# define specific version to install
AWS_VERSION=2.9.7
AWS_ARCH=x86_64
TARGET_OS=linux

echo "Downloading AWS CLI: ${TARGET_OS}-${AWS_ARCH}-${AWS_VERSION} into /tmp"

curl "https://awscli.amazonaws.com/awscli-exe-${TARGET_OS}-${AWS_ARCH}-${AWS_VERSION}.zip" -o /tmp/awscliv2.zip

echo "Extracting isntaller from downloaded archive"
unzip -d /tmp /tmp/awscliv2.zip

echo "Running installer from /tmp"
/tmp/aws/install

echo "Cleaning up /tmp"
rm /tmp/awscliv2.zip