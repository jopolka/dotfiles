#!/bin/sh
sudo apt-get install -y tmux
git clone https://github.com/tmux-plugins/tpm "$(pwd)"/tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-resurrect "$(pwd)"/tmux/plugins/tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-sensible "$(pwd)"/tmux/plugins/tmux-sensible

ln -sf "$(pwd)"/tmux ~/.tmux
ln -sf "$(pwd)"/tmux/.tmux.conf ~/.tmux.conf
