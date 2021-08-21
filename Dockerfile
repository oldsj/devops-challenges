FROM debian:bullseye-slim@sha256:2a6fd917bbc6b8c0c4f5d05b2f831b27003dc24df486e3ec8b3f563fe9c06503
ARG AWS_CLI_VER
ARG TERRAFORM_VER
ENV AWS_CLI_VER=${AWS_CLI_VER}
ENV TERRAFORM_VER=${TERRAFORM_VER}

RUN apt-get update && apt-get install -y \
    curl \
    git \
    gnupg \
    jq \
    less \
    openssh-client \
    unzip
WORKDIR /tmp
COPY scripts/ .
RUN ./install-aws.sh
RUN ./install-terraform.sh
