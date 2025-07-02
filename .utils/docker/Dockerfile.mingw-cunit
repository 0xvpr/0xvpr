# File:         DockerFile

# Created by:   VPR
# Created:      February 12th, 2024

# Updated by:   VPR
# Updated:      May 17th, 2024

FROM ubuntu:24.04

# Set env to avoid user input interruption during installation
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install required packages
RUN apt-get update && apt upgrade -y
RUN apt-get install -y --no-install-recommends \
    wget \
    curl \
    ca-certificates \
    build-essential \
    cmake \
    vim \
    mingw-w64
RUN update-ca-certificates

# Create working environment
WORKDIR /var/opt/dev

# Copy sources
COPY src src
COPY Makefile Makefile
COPY CMakeLists.txt CMakeLists.txt
COPY mingw-toolchain.cmake mingw-toolchain.cmake

# Set docker user to local user uid:gid
ARG LOCAL_USER
ARG LOCAL_UID
ARG LOCAL_GID

RUN if getent group $LOCAL_GID > /dev/null; \
    then \
        groupmod -n $LOCAL_USER `getent group $LOCAL_GID | cut -f1 -d:`; \
    else \
        groupadd -g $LOCAL_GID $LOCAL_USER; \
    fi

RUN if getent group $LOCAL_UID > /dev/null; \
    then \
        usermod -l $LOCAL_USER -d /home/$LOCAL_USER -m `getent passwd 1000 | cut -f1 -d:`; \
    else \
        useradd -m -u $LOCAL_UID -g $LOCAL_GID -s /bin/bash $LOCAL_USER; \
    fi

RUN chown -R $LOCAL_USER:$LOCAL_USER /var/opt/dev

# Install CUnit
RUN mkdir -p ~/downloads
RUN wget --no-check-certificate https://mirror.msys2.org/mingw/mingw64/mingw-w64-x86_64-cunit-2.1.3-3-any.pkg.tar.xz -O ~/downloads/mingw-w64-x86_64-cunit-2.1.3-3-any.pkg.tar.xz
RUN tar -xf ~/downloads/mingw-w64-x86_64-cunit-2.1.3-3-any.pkg.tar.xz -C /usr/local/share

# Become user
USER $LOCAL_USER
ENV HOME=/home/$LOCAL_USER
