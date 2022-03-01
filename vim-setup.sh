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

cp .vimrc ~/.vimrc
cp .vim ~/.vim -r

mkdir -p ~/.vim/bundle/

(
    git clone https://github.com/neoclide/coc.nvim ~/.vim/bundle/coc.nvim
    cd ~/.vim/bundle/coc.nvim && yarnpkg install
)

git clone https://github.com/preservim/nerdcommenter ~/.vim/bundle/nerdcommenter
git clone https://github.com/preservim/nerdtree ~/.vim/bundle/nerdtree
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
