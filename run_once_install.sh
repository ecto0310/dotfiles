source "${HOME}"/.zshenv

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
cargo install --locked sheldon starship
