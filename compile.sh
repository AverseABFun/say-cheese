#!/bin/env bash
if [ "$2" = "--clean" ]; then
    cargo clean
fi
if [ "$1" = "--restore" ]; then
    cp ./backup/say-cheese /home/arthur/say-cheese/target/x86_64-unknown-linux-gnu/release
fi
RUSTFLAGS="-Zlocation-detail=none -Zfmt-debug=none -Clink-args=-Wl,--strip-all" cargo build \
  -Z build-std=panic_abort \
  -Z build-std-features=optimize_for_size,panic_immediate_abort \
  --release --target=x86_64-unknown-linux-gnu

if [ "$1" = "--backup" ]; then
    cp /home/arthur/say-cheese/target/x86_64-unknown-linux-gnu/release/say-cheese ./backup
fi

strip --remove-section=.comment --remove-section=.relro_padding --remove-section=.gnu_debuglink \
    --remove-section=.gnu.version --remove-section=.eh_frame --remove-section=.gnu.hash \
    --remove-section=.note.ABI-tag --remove-section=.note.gnu.build-id --remove-section=.eh_frame_hdr \
    --remove-section=.tm_clone_table --strip-debug \
    /home/arthur/say-cheese/target/x86_64-unknown-linux-gnu/release/say-cheese