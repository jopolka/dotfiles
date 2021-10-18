#!/bin/bash

#create directories

#install packages
sudo apt-get install i3-wm rofi i3blocks scrot zsh ripgrep bat pdfmod tmux arandr
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#link dotfiles
ln -sf ~/dotfiles/.i3 ~/.i3
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.oh-my-zsh ~/.oh-my-zsh
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tmux ~/.tmux
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/autorandr ~/.config/autorandr
ln -sf ~/dotfiles/rofi ~/.config/rofi
ln -sf ~/dotfiles/i3blocks ~/.config/i3blocks
ln -sf ~/dotfiles/coc-settings.json ~/.vim/coc-settings.json
