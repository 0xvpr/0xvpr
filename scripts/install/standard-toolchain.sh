#!/bin/bash

# Created by:   VPR
# Created:      December 7th, 2021
#
# Updated by:   VPR
# Updated:      August 8th, 2025

set -o pipefail
set -o errexit
set -o nounset
set -o xtrace

# Set timezone to avoid input requirements
TZ=America/New_York
[[ $(diff "/usr/share/zoneinfo/${TZ}" /etc/localtime) ]] || sudo ln -s /usr/share/zoneinfo/${TZ} /etc/localtime && sudo echo ${TZ} > /etc/timezone

# Install a high enough node version for nvim
[[ $(which nodejs) ]] || curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -

# Update repositories
sudo apt update && sudo apt upgrade -y --no-install-recommends
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
  net-tools \
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
  python3-dev \
  nodejs

# Get yarn for vim
[[ $(which cmdtest) ]] || sudo apt remove --purge cmdtest -y
sudo corepack enable
sudo corepack prepare yarn@stable --activate
echo 'Y' | yarn -v 
