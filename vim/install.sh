#!/bin/sh
sudo apt-get install -y vim npm

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -es -u ~/.vimrc -i NONE -c "PlugInstall" -c "qa"
vim -es -u ~/.vimrc -i NONE -c "CocInstall -sync coc-css coc-eslint coc-fzf-preview coc-git coc-go coc-json coc-lists coc-prettier coc-python coc-sh coc-sql coc-tsserver coc-vetur" -c "qa"

ln -sf "$(pwd)"/vim/.vimrc ~/.vimrc
ln -sf "$(pwd)"/vim/coc-settings.json ~/.vim/coc-settings.json
