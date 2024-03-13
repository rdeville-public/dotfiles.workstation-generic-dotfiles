#!/usr/bin/env bash
# """Setup script to install symlinks if specified
# """

# shellcheck disable=SC2034
SCRIPTPATH="$( cd -- "$(dirname "$0")" &>/dev/null || exit 1 ; pwd -P )"
SCRIPTNAME="$(basename "$0")"

init_setup(){
  local setup_file="/tmp/_setup.sh"
  if ping -q -c 1 -W 1 framagit.org &> /dev/null
  then
    # shellcheck disable=SC1090
    source <(curl -s https://framagit.org/-/snippets/7207/raw/main/_get_setup.sh)
  elif [[ -f "${setup_file}" ]]
  then
    echo -e "\e[1;32m[INFO]\e[0m\e[32m ${SCRIPTNAME}: Not able to ping \e[1;31mframagit.org, will source existing **${setup_file}**\e[0m"
    # shellcheck disable=SC1090
    source <(cat "${setup_file}")
  else
    echo -e "\e[1;31m[ERROR]\e[0m\e[31m ${SCRIPTNAME}: Not able to ping \e[1;31mframagit.org\e[0m"
    echo -e "\e[1;31m[ERROR]\e[0m\e[31m ${SCRIPTNAME}: And setup lib file ${setup_file} does not exists.\e[0m"
    echo -e "\e[1;31m[ERROR]\e[0m\e[31m ${SCRIPTNAME}: Logger not available, script will now exit\e[0m"
    exit 1
  fi
}

main(){
  local DEBUG_LEVEL="${SETUP_DEBUG_LEVEL:-"INFO"}"
  init_setup
  setup "LINKS" "PKGS" "CRONS"
}

DATA_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}"
CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}"

declare -A LINKS
LINKS["${CONFIG_DIR}/alacritty"]="${SCRIPTPATH}/alacritty"
LINKS["${CONFIG_DIR}/bluetuith"]="${SCRIPTPATH}/bluetuith"
LINKS["${CONFIG_DIR}/bugwarrior"]="${SCRIPTPATH}/bugwarrior"
LINKS["${CONFIG_DIR}/ckb-next"]="${SCRIPTPATH}/ckb-next"
LINKS["${CONFIG_DIR}/gtk-2.0"]="${SCRIPTPATH}/gtk-2.0"
LINKS["${CONFIG_DIR}/gtk-3.0"]="${SCRIPTPATH}/gtk-3.0"
LINKS["${CONFIG_DIR}/keepassxc"]="${SCRIPTPATH}/keepassxc"
LINKS["${CONFIG_DIR}/nixpkgs"]="${SCRIPTPATH}/nixpkgs"
LINKS["${CONFIG_DIR}/nix"]="${SCRIPTPATH}/nix"
LINKS["${CONFIG_DIR}/picom"]="${SCRIPTPATH}/picom"
LINKS["${CONFIG_DIR}/pulse/default.pa"]="${SCRIPTPATH}/pulse/default.pa"
LINKS["${CONFIG_DIR}/redshift"]="${SCRIPTPATH}/redshift"
LINKS["${CONFIG_DIR}/terraform"]="${SCRIPTPATH}/terraform"
LINKS["${CONFIG_DIR}/vimiv"]="${SCRIPTPATH}/vimiv"

declare -A CRONS
# CRONS["<PATH|CMD>"]="<RECURRENCE>"

PKGS=(
#  "<PKGS_NAME>"
  "alacritty"
  "bluetuith"
  "python3.11-bugwarrior"
  "ckb-next"
  "keepassxc"
  "picom"
  "pulseaudio"
  "pulsemixer"
  "redshift"
  "vimiv-qt"
  "terraform"
)

main "$@"

# vim: ft=sh
