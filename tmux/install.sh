#!/bin/sh
sudo apt-get install -y tmux
git clone https://github.com/tmux-plugins/tmux-tpm "$(pwd)"/tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-resurrect "$(pwd)"/tmux/plugins/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-sensible "$(pwd)"/tmux/plugins/tmux-sensible

ln -s "$(pwd)"/tmux ~/.tmux
ln -s "$(pwd)"/tmux/.tmux.conf ~/.tmux.conf
