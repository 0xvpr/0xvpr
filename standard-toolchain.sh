#!/bin/bash

# Creator: VPR
# Created: December 7, 2021
# Updated: December 7, 2021

set -o pipefail
set -o errexit
set -o nounset
set -o xtrace

apt update && apt upgrade -y
apt install -y --no-install-recommends \
                                       zsh \
                                       zsh-autosuggestions \
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
                                       build-essential \
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
                                       yarn 
