#!/bin/sh
git clone https://github.com/apognu/tuigreet build_tuigreet
cd build_tuigreet
cargo build --release
sudo mv target/release/tuigreet /usr/local/bin/tuigreet
cd ..
rm -rf build_tuigreet
