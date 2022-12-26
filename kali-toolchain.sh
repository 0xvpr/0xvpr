#!/bin/bash

# Created By:   VPR
# Created:      December 7, 2021

# Updated by:   VPR
# Updated:      December 10, 2022

set -o pipefail
set -o errexit
set -o nounset
set -o xtrace

export TZ=America/New_York
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

apt update && apt dist-upgrade && apt upgrade -y
apt install -y --no-install-recommends \
    apt-utils \
    zsh \
    zsh-autosuggestions \
    file \
    zip \
    screen \
    tree \
    tmux \
    git \
    curl \
    wget \
    htop \
    iftop \
    iotop \
    vim \
    neovim \
    kali-tools-fuzzing \
    kali-linux-headless \
    build-essential \
    pkg-config \
    mingw-w64 \
    mingw-w64-common \
    mingw-w64-i686-dev \
    mingw-w64-x86-64-dev \
    clang \
    gcc \
    gdb \
    cscope \
    python2-dev \
    python3-dev \
    nodejs \
    ruby \
    yarnpkg

# If WSL2
apt install -y --no-install-recommends \
    kali-win-kex
