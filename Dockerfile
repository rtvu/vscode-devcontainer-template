FROM buildpack-deps:focal

ARG USER_ID
ARG GROUP_ID
ARG DEBIAN_FRONTEND=noninteractive

ENV LANG=C.UTF-8

RUN /bin/bash -c "if [[ -z \"$USER_ID\" ]] ; then exit 1 ; fi"
RUN /bin/bash -c "if [[ -z \"$GROUP_ID\" ]] ; then exit 1 ; fi"

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    sudo \
    && \
  rm -rf /var/lib/apt/lists/*

RUN \
  addgroup --gid $GROUP_ID user && \
  adduser --disabled-password --gecos "" --uid $USER_ID --gid $GROUP_ID user && \
  echo "user:user" | chpasswd && \
  usermod -aG sudo user

USER user

RUN \
  mkdir /home/user/project

WORKDIR /home/user/project

CMD ["/bin/bash"]
