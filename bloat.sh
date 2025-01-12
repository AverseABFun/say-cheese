#!/bin/env bash
RUSTFLAGS="-Zlocation-detail=none -Zfmt-debug=none -Clink-args=-Wl,--strip-all" cargo bloat \
  -Z build-std=std,panic_abort \
  -Z build-std-features=optimize_for_size,panic_immediate_abort \
  --release --target=x86_64-unknown-linux-gnu $@