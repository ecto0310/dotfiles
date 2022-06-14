#!/usr/bin/env bash

set -eu

print_environment() {
    echo ".dotfiles directory: $DOT_DIRECTORY"
    echo "wsl: $IS_WSL"
    echo "package maneger: $PACKAGE_MANEGER"
}

check_environment() {
    DOT_DIRECTORY="$(cd "$(dirname "$0")" && pwd)"

    if type "wslpath" > /dev/null 2>&1; then
        IS_WSL=true
    else
        IS_WSL=false
    fi

    if type "apt" > /dev/null 2>&1; then
        PACKAGE_MANEGER="apt"
    elif type "pacman" > /dev/null 2>&1; then
        PACKAGE_MANEGER="pacman"
    else
        PACKAGE_MANEGER="unknown"
    fi

    print_environment
    read -rp "Install this environment? [y/n]"  check
    case $check in
        ![Yy]* ) exit;;
    esac
}

set_xdg_directories() {
    XDG_CONFIG_HOME="${HOME}"/.config
}

create_xdg_directories() {
    if [ ! -e "$XDG_CONFIG_HOME" ]; then
        mkdir -m 700 "$XDG_CONFIG_HOME"
    fi
}

create_symbolic_links() {
    while read -r target; do
        link_name="${HOME}"/$(basename "${target}")
        ln -nfs "${target}" "${link_name}"
    done < <(find "${DOT_DIRECTORY}"/home/ -mindepth 1 -maxdepth 1)
    
    while read -r target; do
        link_name="${XDG_CONFIG_HOME}"/$(basename "${target}")
        ln -nfs "${target}" "${link_name}"
    done < <(find "${DOT_DIRECTORY}"/.config/ -mindepth 1 -maxdepth 1)
}

check_environment
set_xdg_directories
create_xdg_directories
create_symbolic_links
