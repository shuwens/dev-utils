#!/bin/bash

set -e

rm -rf $HOME/.cargo/registry

# https://github.com/mcgoo/vcpkg-rs/pull/29
# Remove the Cargo.lock file, the checked in version isn't understood
# at 1.12.0.

if [ -e "Cargo.lock" ]; then
  rm Cargo.lock
else
  echo "Passing, no Cargo.lock.."
fi

# Tell cargo to use a different copy of crates.io.
mkdir -p .cargo
cat <<EOF > .cargo/config
  [source.crates-io]
  registry = "file://$(pwd)/../crates-io-rewound"
EOF
cat .cargo/config

mkdir -p $HOME/dev/others
mkdir -p $HOME/data
cd ..

# create copy of crates.io, reset back to when rand 0.8.0 didn't
# exist in index.
if [ -e "crates-io-rewound" ]; then
  echo "Great, we already have a crates io rewound .."
else
  cd $HOME/dev/others
  git clone https://github.com/rust-lang/crates.io-index.git crates-io-rewound
fi
cd crates-io-rewound

git reset --hard 46a429eac9f
