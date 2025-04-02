#!/bin/bash

# Created by:   VPR
# Created:      December 7th, 2021

# Updated by:   VPR
# Updated:      March 30th, 2025


set -o pipefail
set -o errexit
set -o nounset
set -o xtrace

_VIM_DIR="${HOME}/.vim"
_VIMRC="${HOME}/.vimrc"
_YARN=""

(
    # Set script directory as cwd
    cd "${0%/*}"

    # Make a copy of the old vimrc with timestamp
    if [ -f ${_VIMRC} ]
    then
        cp ${_VIMRC} ${_VIMRC}_`date '+%Y-%m-%d_%H-%M-%S'`
    fi

    # Initialize ~/.vim
    if [ -d ${_VIM_DIR} ]
    then
        cp -r ${_VIM_DIR} ${_VIM_DIR}_`date '+%Y-%m-%d_%H-%M-%S'`
    fi

    # Add and link nvim config
    mkdir -p ~/.config/nvim
    #[[ $(diff ../.config/nvim/init.vim ~/.config/nvim/init.vim) ]] && cp -r ../.config/nvim/init.vim ~/.config/nvim
    #cp -r ../.vim/ ${_VIM_DIR}/
    #cp -r ../.vimrc ${_VIMRC}

    # Install pathogen
    #mkdir -p ${_VIM_DIR}/autoload ${_VIM_DIR}/bundle
    #curl -LSso ${_VIM_DIR}/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    # Check yarn
    #if [[ $(type yarn) ]]
    #then
        #_YARN="$(which yarn)"
    #elif [[ $(type yarnpkg) ]]
    if [[ $(type yarnpkg) ]]
    then
        _YARN="$(which yarnpkg)"
    fi

    # Build and install COC
    #git clone --recursive https://github.com/neoclide/coc.nvim ${_VIM_DIR}/bundle/coc.nvim
    (
        cd ${_VIM_DIR}/bundle/coc.nvim && ${_YARN} install
    )

    # Clone additional resources
    #git clone https://github.com/preservim/nerdcommenter ${_VIM_DIR}/bundle/nerdcommenter
    #git clone https://github.com/preservim/nerdtree ${_VIM_DIR}/bundle/nerdtree
    #git clone https://github.com/vim-airline/vim-airline ${_VIM_DIR}/bundle/vim-airline
    #git clone https://github.com/vim-airline/vim-airline-themes ${_VIM_DIR}/bundle/vim-airline-themes
)
