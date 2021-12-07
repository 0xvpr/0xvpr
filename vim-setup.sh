#!/bin/bash

# Creator: VPR
# Created: December 7, 2021
# Updated: December 7, 2021

set -o pipefail
set -o errexit
set -o nounset
set -o xtrace

cp .vim ~/.vim -r

mkdir -p ~/.vim/bundle/

git clone https://github.com/neoclide/coc.nvim ~/.vim/bundle/coc.nvim
git clone https://github.com/preservim/nerdcommenter ~/.vim/bundle/nerdcommenter
git clone https://github.com/preservim/nerdtree ~/.vim/bundle/nerdtree
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
