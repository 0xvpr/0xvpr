#!/bin/bash

# Creator: VPR
# Created: December 7th, 2021
# Updated: March 1st, 2022

set -o pipefail
set -o errexit
set -o nounset
set -o xtrace

if [ -f ~/.vimrc ]
then
    mv ~/.vimrc ~/.vimrc.bak
fi

# Initialize ~/.vim
cp config/.vim ~/.vim -r
cp config/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle/

# Add and link nvim config to ~/.vimrc
mkdir -p ~/.config
cp config/nvim ~/.config -r

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Build and install COC
(
    git clone https://github.com/neoclide/coc.nvim ~/.vim/bundle/coc.nvim
    cd ~/.vim/bundle/coc.nvim && yarnpkg install
)

# Clone additional resources
git clone https://github.com/preservim/nerdcommenter ~/.vim/bundle/nerdcommenter
git clone https://github.com/preservim/nerdtree ~/.vim/bundle/nerdtree
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
