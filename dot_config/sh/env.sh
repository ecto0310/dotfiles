#!/usr/bin/env sh

# XDG Base Directory
export XDG_CONFIG_HOME="${HOME}"/.config
export XDG_CACHE_HOME="${HOME}"/.cache
export XDG_DATA_HOME="${HOME}"/.local/share
export XDG_STATE_HOME="${HOME}"/.local/state
export PATH="${HOME}"/.local/bin:"${PATH}"

# Rust
export RUSTUP_HOME="${XDG_DATA_HOME}"/rustup
export CARGO_HOME="${XDG_DATA_HOME}"/cargo
export PATH="${PATH}":"${CARGO_HOME}"/bin

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
