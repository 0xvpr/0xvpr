#!/usr/bin/env bash

# Created by:   VPR
# Created:      February 5th, 2024

# Updated by:   VPR
# Updated:      February 6th, 2024

set -o pipefail
set -o errexit
set -o nounset
set -o xtrace

# Set timezone to avoid input requirements
export TZ=America/New_York
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# Update repositories
pacman -Syu --no-confirm \
    sudo \
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
    mingw-w64-binutils \
    mingw-w64-crt \
    mingw-w64-gcc \
    mingw-w64-headers \
    mingw-w64-winpthreads \
    clangd \
    clang \
    pkg-config \
    gdb \
    gcc \
    cmake \
    cscope \
    python2 \
    python3 \
    nodejs \
    yarn
