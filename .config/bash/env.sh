#!/usr/bin/env bash

# XDG Base Directories
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

# WSL only
if type "wslpath" > /dev/null 2>&1; then
    export IS_WSL=true
else
    export IS_WSL=false
fi
