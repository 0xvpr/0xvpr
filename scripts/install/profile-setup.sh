#!/bin/bash

# Created By:   VPR
# Created:      March 1st, 2022

# Updated by:   VPR
# Updated:      September 10th, 2025


set -o pipefail
set -o errexit
set -o nounset


function emplace-config-file {
  local TARGET_FILE="${1}"

  if [[ ${#} -ne 1 ]] || ! [[ -f ../../${TARGET_FILE} ]]; then
    printf "cannot stat: ../../${TARGET_FILE}\n" 2>&1
    exit 1
  fi

  if [[ -f ~/${TARGET_FILE} ]]; then
    cp "~/${TARGET_FILE}" "~/${TARGET_FILE}_`date '+%Y-%m-%d_%H-%M-%S'`"
  fi
  cp "../../${TARGET_FILE}" "~/${TARGET_FILE}"
}

function emplace-config-directory {
  local TARGET_DIR="${1}"

  if [[ ${#} -ne 1 ]] || ! [[ -d ../../${TARGET_DIR} ]]; then
    printf "cannot stat: ../../${TARGET_DIR}\n" 2>&1
    exit 1
  fi

  if [[ -d ~/${TARGET_DIR} ]]; then
    cp "~/${TARGET_DIR}" "~/${TARGET_DIR}_`date '+%Y-%m-%d_%H-%M-%S'`"
  fi
  cp -r "../../${TARGET_DIR}" "~/${TARGET_DIR}"
}

(
    # Set script directory as cwd
    builtin cd "${0%/*}"
 
    [[ -d ~/.config ]] || mkdir ~/.config/nvim
    emplace-config-file      ".config/nvim/init.vim"
    emplace-config-file      ".tmux.conf"
    emplace-config-file      ".zshrc"
    emplace-config-directory ".utils"
   
    # Install p10k
    if ! [[ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    fi
    
    # Install oh-my-zsh
    curl -LSso- https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | /bin/bash -- 
)
