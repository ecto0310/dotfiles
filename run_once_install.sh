#!/usr/bin/env bash

source "${HOME}"/.zshenv

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
cargo install cargo-binstall
cargo binstall -y mise sheldon starship

mkdir -m 700 "${XDG_CONFIG_HOME}"
mkdir -m 700 "${XDG_CACHE_HOME}"
mkdir -m 700 "${XDG_DATA_HOME}"
mkdir -m 700 "${XDG_STATE_HOME}"
