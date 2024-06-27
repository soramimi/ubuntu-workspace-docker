FROM ubuntu:20.04

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y apt-utils sudo vim git iputils-ping net-tools rename openssh-server
RUN apt install -y software-properties-common
RUN apt install -y build-essential clang libncurses5 libc++-dev cmake
RUN apt install -y python3 python3-pip ruby zstd wget curl
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y qtcreator qtbase5-dev
RUN apt install -y geany

ARG UID
ARG GID
ARG UNAME
ARG GNAME
ARG HOMEDIR
RUN groupadd -g ${GID} ${GNAME} && useradd -s /bin/bash -u ${UID} -g ${GID} ${UNAME} -M -d ${HOMEDIR}

COPY files/sudoers /etc/
COPY files/sshd_config /etc/ssh/
RUN mkdir -p /run/sshd

COPY files/cmd /tmp/
CMD ["/bin/sh", "/tmp/cmd"]

