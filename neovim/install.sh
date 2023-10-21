#!/bin/sh

wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz .
tar xzvf nvim-linux64.tar.gz

sudo mv nvim-linux64/bin/nvim /usr/bin/nvim

rm -rf nvim-linux64
rm nvim-linux64.tar.gz
