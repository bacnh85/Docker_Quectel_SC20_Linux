FROM ubuntu:16.04
ARG UID=501
ARG UNAME=bacnh

# Update packages
RUN rm /bin/sh && ln -s bash /bin/sh \ 
# add user package
     && apt-get update \
     && apt-get install -y software-properties-common \ 
     && add-apt-repository ppa:openjdk-r/ppa \
     &&  apt-get update && apt-get install -y \
	gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
     xterm tar locales tree\
     # Extra pkg
     gnupg flex bison gperf zip curl zlib1g-dev lib32z1 \ 
     lib32ncurses5 x11proto-core-dev libx11-dev libxml-simple-perl libc6-dev libgl1-mesa-dev \
     tofrodos python-markdown libxml2-utils xsltproc openjdk-7-jdk  \
# add user tux
	&& useradd -m -u $UID -g staff -s /bin/bash $UNAME \
     && mkdir /opt/build \
     && chown -R ${UID}:staff /opt/build

# Setup the environment
RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

USER $UNAME
WORKDIR /opt
VOLUME [ "/opt" "/opt/build" ] 

ENTRYPOINT /bin/bash
CMD ["true"]