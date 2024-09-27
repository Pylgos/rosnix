#!/bin/sh
RUST_BACKTRACE=1 cargo run --manifest-path=generator/Cargo.toml -- --config-file rosnix.toml generate

