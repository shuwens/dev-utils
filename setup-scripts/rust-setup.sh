#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install libssl-dev pkg-config cmake zlib1g-dev


if [ -e $HOME/.cargo/ ]; then
	echo "Passing, Rust already exists.."
	source $HOME/.cargo/env
	rustup default nightly
else
	# setup rust
	curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --default-toolchain=nightly
	source $HOME/.cargo/env
fi


rustup component add rust-src rustfmt
rustup component add clippy rls rust-analysis

cargo install --force cargo-tree
cargo install --force cargo-tarpaulin
cargo install --force cargo-udeps
cargo install --force cargo-deny
cargo install --force cargo-sweep
cargo install --force cargo-readme
cargo install --force --git https://github.com/kbknapp/cargo-outdated
