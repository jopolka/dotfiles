#!/bin/sh
git clone https://github.com/kennylevinsen/greetd build_greetd
cd build_greetd
cargo build --release
sudo cp target/release/{greetd,agreety} /usr/local/bin/
sudo cp greetd.service /etc/systemd/system/greetd.service
cd ..
rm -rf build_greetd
