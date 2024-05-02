#!/usr/bin/env bash

# Creator:    VPR
# Created:    December 7th, 2021
# Updated:    June 11th, 2022

set -o pipefail
set -o errexit
set -o nounset
set -o xtrace

# Set timezone to avoid input requirements
export TZ=America/Chicago
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# Install a high enough node version for nvim
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

# Update repositories
sudo apt update
sudo apt install -y --no-install-recommends \
    sudo \
    apt-utils \
    zsh \
    zsh-autosuggestions \
    tmux \
    git \
    curl \
    wget \
    htop \
    iftop \
    iotop \
    vim \
    neovim \
    tree \
    zip \
    mingw-w64 \
    mingw-w64-common \
    mingw-w64-i686-dev \
    mingw-w64-x86-64-dev \
    build-essential \
    pkg-config \
    gdb \
    gcc \
    cmake \
    cscope \
    python2-dev \
    python3-dev \
    nodejs \
    yarnpkg 
