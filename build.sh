#!/usr/bin/sh
set -e

cd plugins/rust
cargo build --target=wasm32-unknown-unknown --release

cargo run --manifest-path /e/Programming/Rust/Wasynth/codegen/luajit/Cargo.toml target/wasm32-unknown-unknown/release/wasmtorio_rust_plugin.wasm > rust-control.lua


# wasm2lua abi.optimized.wat.wasm rust-control.lua
# wasm2lua target/wasm32-unknown-unknown/release/wasmtorio_rust_plugin.wasm rust-control.lua
cd ../..

echo "All done."
