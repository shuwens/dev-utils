#!/bin/bash

set -e

if [ -e $HOME/.cargo/ ]; then
	echo "Passing, Rust already exists.."
else
	# setup rust
	curl https://sh.rustup.rs -sSf | sh  # Install rustup
	rustup default nightly
fi

source $HOME/.cargo/env
rustup install nightly
rustup default nightly

rustup component add rust-src rustfmt
rustup component add clippy rls rust-analysis

cargo install --force cargo-tree cargo-readme
cargo install --force --git https://github.com/kbknapp/cargo-outdated
