#!/bin/sh
mkdir install_fonts
cd install_fonts
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output MesloLGS\ NF\ Regular.ttf
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output MesloLGS\ NF\ Bold.ttf
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output MesloLGS\ NF\ Italic.ttf
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20fItalic.ttf --output MesloLGS\ NF\ Bold\ Italic.ttf
mkdir -p ~/.fonts
cp *.ttf ~/.fonts/

git clone https://github.com/stark/siji && cd siji
./install.sh
cd ..

curl -L https://use.fontawesome.com/releases/v5.15.4/fontawesome-free-5.15.4-desktop.zip
unzip fontawesome-free-5.15.4-desktop.zip
cd fontawesome-free-5.15.4-desktop
cp Font\ Awesome\ 5\ Free-Regular-400.otf ~/.local/share/fonts/
mkdir -p ~/.fonts
cp *.oft ~/.fonts/

cd ..

cd ..
rm -rf install_fonts
fc-cache -fv
