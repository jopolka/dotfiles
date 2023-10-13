#!/bin/sh

curl -L https://github.com/Crosse/font-install/releases/download/v1.5.0/font-install-linux-amd64.zip --output font-install-linux-amd64.zip
unzip font-install-linux-amd64.zip
sudo mv font-install-linux-amd64 /usr/local/bin/font-install
rm font-install-linux-amd64.zip


font-install https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
font-install https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
font-install https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
font-install https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20fItalic.ttf
font-install https://use.fontawesome.com/releases/v5.15.4/fontawesome-free-5.15.4-desktop.zip
git clone https://github.com/stark/siji
cd siji
./install.sh
cd ..
rm -rf siji

fc-cache -fv
