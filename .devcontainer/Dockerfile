# inherit from Microsoft's base devcontainer (which has git installed)
FROM mcr.microsoft.com/vscode/devcontainers/base:buster

# these are the specific versions of tools that are used in the course
ENV TF_VERSION=1.3.6 \
        TF_ARCH=amd64 \
        AWS_VERSION=2.9.7 \
        AWS_ARCH=x86_64 \
        TARGET_OS=linux

# update system packages for good measure
RUN apt-get update

# install AWS CLI directly from Amazon's distribution site
RUN curl "https://awscli.amazonaws.com/awscli-exe-${TARGET_OS}-${AWS_ARCH}-${AWS_VERSION}.zip" -o /tmp/awscliv2.zip && \
        unzip -d /tmp /tmp/awscliv2.zip && \
        sudo /tmp/aws/install && \
        rm /tmp/awscliv2.zip

# install Terraform directly from HashiCorp's distribution site
RUN curl -sSL -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_${TARGET_OS}_${TF_ARCH}.zip 2>&1 && \
        sudo unzip -d /usr/local/bin /tmp/terraform.zip && \
        sudo chmod +x /usr/local/bin/terraform && \
        rm /tmp/terraform.zip