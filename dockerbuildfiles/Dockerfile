FROM ubuntu:24.04

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y apt-utils sudo vim git iputils-ping net-tools rename openssh-server
RUN apt install -y software-properties-common
RUN apt install -y build-essential clang libc++-dev cmake
#RUN apt install -y libncurses5
RUN apt install -y libncurses6
RUN apt install -y python3 python3-pip ruby zstd wget curl
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y qtcreator qtbase5-dev
RUN apt install -y geany

ARG UID
ARG GID
ARG UNAME
ARG GNAME
ARG HOMEDIR

RUN userdel ubuntu || true
RUN groupdel ubuntu || true
RUN groupadd -g ${GID} ${GNAME} && useradd -s /bin/bash -u ${UID} -g ${GID} ${UNAME} -M -d ${HOMEDIR}

COPY ./sudoers /etc/
COPY ./sshd_config /etc/ssh/
RUN mkdir -p /run/sshd

COPY ./cmd /tmp/
CMD ["/bin/sh", "/tmp/cmd"]

