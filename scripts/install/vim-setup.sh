#!/bin/bash

# Created by:   VPR
# Created:      December 7th, 2021

# Updated by:   VPR
# Updated:      March 29th, 2026


set -o pipefail
set -o errexit
set -o nounset
set -o xtrace


(
    # Set script directory as cwd
    cd "${0%/*}"

    # Make a copy of the old vimrc with timestamp
    if [[ -e ~/.vimrc ]]; then
        cp "${HOME}/.vimrc" "${HOME}/.vimrc_`date '+%Y-%m-%d_%H-%M-%S'`"
    fi

    # Initialize ~/.vim
    if [[ -e ~/.vim ]]; then
        cp -r "${HOME}/.vim" "${HOME}/.vim_`date '+%Y-%m-%d_%H-%M-%S'`"
    fi

    # Add and link nvim config to ~/.vimrc
    [[ -e "${HOME}/.vimrc"  ]] || cp    ../../vimrc ~/.vimrc
    [[ -d "${HOME}/.vim"    ]] || cp -r ../../vim/ ~/.vim/

    # Install pathogen
    if ! [[ -e ~/.vim/autoload/pathogen.vim ]]; then
        mkdir -p ~/.vim/autoload ~/.vim/bundle
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    fi

    # Build and install COC
    [[ -d ~/.vim/bundle/coc.nvim ]] || git clone https://github.com/neoclide/coc.nvim ~/.vim/bundle/coc.nvim
    if [[ -d "${HOME}/.config/coc" ]]; then
        [[ "$(which yarn)" != "" ]] || ( cd ~/.vim/bundle/coc.nvim && yarn )
    fi

    # Clone additional resources
    [[ -d ~/.vim/bundle/nerdcommenter      ]] || git clone https://github.com/preservim/nerdcommenter        ~/.vim/bundle/nerdcommenter
    [[ -d ~/.vim/bundle/nerdtree           ]] || git clone https://github.com/preservim/nerdtree             ~/.vim/bundle/nerdtree
    [[ -d ~/.vim/bundle/vim-airline        ]] || git clone https://github.com/vim-airline/vim-airline        ~/.vim/bundle/vim-airline
    [[ -d ~/.vim/bundle/vim-airline-themes ]] || git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
)
