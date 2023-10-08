#!/bin/sh
mkdir install_fonts
cd install_fonts
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output MesloLGS\ NF\ Regular.ttf
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output MesloLGS\ NF\ Bold.ttf
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output MesloLGS\ NF\ Italic.ttf
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20fItalic.ttf --output MesloLGS\ NF\ Bold\ Italic.ttf
mkdir -p ~/.fonts
cp *.ttf ~/.fonts/
fc-cache -fv
cd ..
rm -rf install_fonts
