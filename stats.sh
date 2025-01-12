#!/bin/env bash
./compile.sh $@
size /home/arthur/say-cheese/target/x86_64-unknown-linux-gnu/release/say-cheese -Ad > stats
size=$(($(du -b /home/arthur/say-cheese/target/x86_64-unknown-linux-gnu/release/say-cheese | awk "{print \$1}") + 0))
du -b /home/arthur/say-cheese/target/x86_64-unknown-linux-gnu/release/say-cheese >> stats

if [ $size -gt 2953 ]; then
    echo "Too big for QR code; shrink to under 2953 bytes" >> stats
    echo "Too big for QR code; shrink to under 2953 bytes"
else
    echo "Small enough for QR code; keep under 2953 bytes" >> stats
fi