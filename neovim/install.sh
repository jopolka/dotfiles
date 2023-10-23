#!/bin/sh

sudo snap install nvim --classic
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

go install mvdan.cc/gofumpt@latest
go install -v github.com/incu6us/goimports-reviser/v3@latest
go install github.com/segmentio/golines@latest
go install github.com/go-delve/delve/cmd/dlv@latest

# symlink stuff in config dir
# tmux integration
# :TSInstall go
