##############
# Base Image #
##############

FROM ubuntu:22.04

#############################
# Setup Basic Configuration #
#############################

ENV LANG=C.UTF-8

RUN \
  apt update && \
  DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    sudo \
    wget \
    && \
  rm -rf /var/lib/apt/lists/*

##############
# Setup User #
##############

ARG USER=user
ARG USER_ID=1000
ARG GROUP_ID=1000

RUN \
  addgroup --gid ${GROUP_ID} ${USER} && \
  adduser --disabled-password --gecos "" --uid ${USER_ID} --gid ${GROUP_ID} ${USER} && \
  usermod -aG sudo ${USER} && \
  echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

########################
# Setup User Workspace #
########################

USER ${USER}

ENV HOME=/home/${USER}

RUN \
  mkdir ${HOME}/workspace

###########
# Startup #
###########

WORKDIR ${HOME}/workspace

CMD ["/bin/bash"]
