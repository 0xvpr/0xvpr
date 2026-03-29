#!/bin/bash

# Created By:   VPR
# Created:      March 1st, 2022

# Updated by:   VPR
# Updated:      March 29th, 2026


set -o pipefail
set -o errexit
set -o nounset


function emplace-config-file {
  local TARGET_FILE="${1}"
  local DEST_FILE="${2}"

  if [[ "${#}" -ne 2 ]] || ! [[ -f "${TARGET_FILE}" ]]; then
    printf "cannot stat: ${TARGET_FILE}\n" 2>&1
    exit 1
  fi

  if [[ -f "${DEST_FILE}" ]]; then
    cp "${DEST_FILE}" "${DEST_FILE}_`date '+%Y-%m-%d_%H-%M-%S'`"
  fi
  cp "${TARGET_FILE}" "${DEST_FILE}"
}

(
    # Set script directory as cwd
    builtin cd "${0%/*}"
 
    [[ -d ~/.config ]] || mkdir ~/.config/nvim
    emplace-config-file     "../../init.vim"    "${HOME}/.config/nvim/init.vim"
    emplace-config-file     "../../tmux.conf"   "${HOME}/.tmux.conf"
    emplace-config-file     "../../bashrc"      "${HOME}/.bashrc"
    emplace-config-file     "../../profile"     "${HOME}/.profile"
    emplace-config-file     "../../vprc"        "${HOME}/.vprc"
)
