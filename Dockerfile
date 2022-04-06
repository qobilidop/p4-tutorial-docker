FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /home/p4

# basic deps
RUN apt-get update && \
    apt install -y \
        curl \
        git \
        gnupg \
        python3 \
        python3-pip \
        python-is-python3 \
        sudo

# p4 deps
# https://github.com/p4lang/p4c#ubuntu
ARG VERSION_ID=20.04
RUN echo "deb http://download.opensuse.org/repositories/home:/p4lang/xUbuntu_${VERSION_ID}/ /" | tee /etc/apt/sources.list.d/home:p4lang.list
RUN curl -L "http://download.opensuse.org/repositories/home:/p4lang/xUbuntu_${VERSION_ID}/Release.key" | apt-key add -
RUN apt-get update && \
    apt install -y \
        p4lang-pi \
        p4lang-bmv2 \
        p4lang-p4c

# mininet
# https://github.com/mininet/mininet/blob/master/INSTALL
RUN git clone https://github.com/mininet/mininet.git \
    && cd mininet \
    && git checkout master
RUN PYTHON=python3 mininet/util/install.sh -fnv

# other deps
RUN apt-get update && \
    apt install -y \
        iputils-ping
RUN pip3 install \
        psutil
