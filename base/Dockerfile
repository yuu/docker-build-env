FROM ubuntu:16.04
MAINTAINER yuu

ENV DEBIAN_FRONTEND noninteractive
RUN sed -i -e 's/\/\/archive.ubuntu.com/\/\/jp.archive.ubuntu.com/g'  /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    sudo ca-certificates locales \
    git tmux curl vim \
    build-essential autoconf automake
RUN apt-get clean
ENV DEBIAN_FRONTEND dialog

ENV LANG=en_US.UTF-8
ENV LC_ALL=$LANG
RUN sed -ie 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    locale-gen --purge $LANG && \
    locale-gen && update-locale LANG=$LANG LC_ALL=$LC_ALL

# user
ENV USERNAME user
RUN adduser $USERNAME
ENV HOME /home/$USERNAME
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo "${USERNAME}:${USERNAME}" | chpasswd
USER $USERNAME

# git
RUN /bin/bash
RUN git config --global user.name "user"
RUN git config --global user.email "user@dummy.com"
RUN git config --global color.ui true

ENV DISPLAY :0
WORKDIR $HOME
