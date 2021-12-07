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
                                       screen \
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
                                       kali-tools-crypto-stego \
                                       kali-tools-hardware \
                                       kali-tools-fuzzing \
                                       kali-linux-headless \
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
                                       ruby \
                                       yarn 
