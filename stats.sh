#!/bin/env bash
./compile.sh $@
size /home/arthur/say-cheese/target/x86_64-unknown-linux-gnu/release/say-cheese -Ad > stats
du -h /home/arthur/say-cheese/target/x86_64-unknown-linux-gnu/release/say-cheese >> stats