FROM debian:bullseye-slim@sha256:2a6fd917bbc6b8c0c4f5d05b2f831b27003dc24df486e3ec8b3f563fe9c06503

RUN apt-get update && apt-get install -y \
    curl \
    git \
    gnupg \
    groff \
    jq \
    less \
    openssh-client \
    # postgres v13
    postgresql-client \
    sudo \
    unzip
WORKDIR /tmp
# bats testing framework
ARG BATS_VER \
    BATS_SUPPORT_VER \
    BATS_ASSERT_VER
RUN git clone https://github.com/bats-core/bats-core.git && \
    cd bats-core && \
    git checkout ${BATS_VER} && \
    ./install.sh /usr/local && \
    cd ../ && \
    git clone https://github.com/bats-core/bats-support.git /test/bats-support && \
    cd /test/bats-support && \
    git checkout ${BATS_SUPPORT_VER} && \
    git clone https://github.com/bats-core/bats-assert.git /test/bats-assert && \
    cd /test/bats-assert && \
    git checkout ${BATS_ASSERT_VER}  
COPY scripts/install* ./
ARG AWS_CLI_VER
ENV AWS_CLI_VER=${AWS_CLI_VER}
RUN ./install-aws.sh && \
    echo '/usr/local/bin/aws --endpoint-url http://moto:5000 "$@"' > /opt/aws && chmod +x /opt/aws
ARG TERRAFORM_VER
ENV TERRAFORM_VER=${TERRAFORM_VER}
COPY files/hashi.asc /tmp/hashi.asc 
RUN ./install-terraform.sh
COPY scripts/docker-entrypoint.sh /docker-entrypoint.sh
COPY scripts/test.sh /test/test.sh
COPY scripts/load.bash /test/load.bash
RUN useradd -ms /bin/bash -G sudo me && \
    echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER me
#  set up tab completion and shell environment
RUN \
    terraform -install-autocomplete && \
    echo "complete -C '/usr/local/bin/aws_completer' aws" >> $HOME/.bashrc && \
    echo "alias ll='ls -l'" >> $HOME/.bash_aliases && \
    echo "PATH=/opt:$PATH" >> $HOME/.bashrc

VOLUME [ "/challenges" ]
WORKDIR /challenges
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "bash" ]
