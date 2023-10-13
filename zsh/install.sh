#!/bin/sh
sudo apt install zsh tmux -y
ln -s -f "$(pwd)"/zsh/.zshrc ~/.zshrc

sh -c "ZSH=$(pwd)/zsh/.oh-my-zsh $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
ln -s "$(pwd)"/zsh/.oh-my-zsh ~/.oh-my-zsh

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$(pwd)"/zsh/.oh-my-zsh/custom/themes/powerlevel10k
ln -s "$(pwd)"/zsh/.p10k.zsh ~/.p10k.zsh

sudo chsh -s "$(which zsh)" "$(whoami)"
