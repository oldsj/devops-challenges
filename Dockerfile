FROM debian:bullseye-slim@sha256:2a6fd917bbc6b8c0c4f5d05b2f831b27003dc24df486e3ec8b3f563fe9c06503

RUN apt-get update && apt-get install -y \
    curl \
    git \
    golang \
    gnupg \
    groff \
    jq \
    less \
    openssh-client \
    sudo \
    unzip
WORKDIR /tmp
COPY scripts/install* .
ARG AWS_CLI_VER
ENV AWS_CLI_VER=${AWS_CLI_VER}
RUN ./install-aws.sh
ARG TERRAFORM_VER
ENV TERRAFORM_VER=${TERRAFORM_VER}
COPY files/hashi.asc /tmp/hashi.asc 
RUN ./install-terraform.sh

RUN useradd -ms /bin/bash -G sudo me && \
    echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER me
#  set up tab completion and shell environment
RUN \
    terraform -install-autocomplete && \
    echo "complete -C '/usr/local/bin/aws_completer' aws" >> $HOME/.bashrc && \
    echo "alias aws='aws --endpoint-url http://moto:5000'" >> $HOME/.bash_aliases && \
    echo "alias ll='ls -l'" >> $HOME/.bash_aliases

VOLUME [ "/challenges" ]
WORKDIR /challenges
USER root
COPY scripts/docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "bash" ]
