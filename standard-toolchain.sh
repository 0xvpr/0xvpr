#!/bin/bash

# Creator: VPR
# Created: December 7th, 2021
# Updated: March 1st, 2021

set -o pipefail
set -o errexit
set -o nounset
set -o xtrace

# Set timezone to avoid input requirements
export TZ=America/Chicago
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

apt update && apt upgrade -y
apt install -y --no-install-recommends \
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
                                       llvm \
                                       clang \
                                       clangd \
                                       cmake \
                                       cscope \
                                       python2-dev \
                                       python3-dev \
                                       nodejs \
                                       yarnpkg 

# Copy config files
cp config/.tmux.conf ~/
cp config/.zshrc ~/
cp config/.utils ~/

# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
