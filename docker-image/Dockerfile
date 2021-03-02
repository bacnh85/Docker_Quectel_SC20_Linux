FROM ubuntu:16.04

# Docker variables
ARG UID=1000
ARG GID=1000

# Update packages
RUN rm /bin/sh && ln -s bash /bin/sh \ 
     # add user package
     && apt-get update \
     && apt-get install -y software-properties-common \ 
     && add-apt-repository ppa:openjdk/ppa \
     &&  apt-get update && apt-get install -y \
	gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
     xterm tar locales tree\
     # Extra pkg
     gnupg flex bison gperf zip curl zlib1g-dev lib32z1 \ 
     lib32ncurses5 x11proto-core-dev libx11-dev libxml-simple-perl libc6-dev libgl1-mesa-dev \
     tofrodos libxml2-utils xsltproc openjdk-7-jdk vim \
     # Clean up
     && rm -rf /var/lib/apt/lists/*

# Setup the environment
RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

WORKDIR /opt
VOLUME [ "/opt" ]

COPY entrypoint.sh /
RUN chmod u+x /entrypoint.sh
ENTRYPOINT ["sh","/entrypoint.sh"]