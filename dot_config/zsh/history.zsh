#!/usr/bin/env zsh

if [[ ! -d "${XDG_STATE_HOME}"/zsh ]]; then
    mkdir -m 700 "${XDG_STATE_HOME}"/zsh
fi
export HISTFILE="${XDG_STATE_HOME}"/zsh/history
export HISTSIZE=1000000
export SAVEHIST=1000000
