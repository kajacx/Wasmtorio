#!/usr/bin/sh
set -e

cd plugins/rust
cargo build --target=wasm32-unknown-unknown
cd ../..

echo "All done."
