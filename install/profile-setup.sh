#!/bin/bash

# Created By:   VPR
# Created:      March 1st, 2022

# Updated by:   VPR
# Updated:      December 10, 2022

# Copy config files
cp config/.tmux.conf ~/
cp config/.zshrc ~/
cp -r config/.utils ~/

# Install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
