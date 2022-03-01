#!/bin/bash

# Creator: VPR
# Created: March 1st, 2022
# Updated: March 1st, 2022

# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Copy config files
cp config/.tmux.conf ~/
cp config/.zshrc ~/
cp config/.utils ~/
