#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install libssl-dev pkg-config cmake zlib1g-dev -y


if [ -e $HOME/.cargo/ ]; then
	echo "Passing, Rust already exists.."
	source $HOME/.cargo/env
	rustup default nightly
else
	# setup rust
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
	rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy rust-src rustfmt miri
	source $HOME/.cargo/env
fi

# rustup component add clippy rls rust-analysis
#
cargo install --force cargo-udeps
cargo install --force cargo-sweep
# cargo install --force cargo-readme

cargo install --force cargo-deny
# cargo install --force cargo-tarpaulin
cargo install --force --git https://github.com/kbknapp/cargo-outdated
# cargo install --force cargo-deny
# cargo install --force cargo-tarpaulin
