#!/bin/sh
sudo mkdir /etc/greetd
sudo sudo ln -f -s $(shell pwd)/greetd/config.toml /etc/greetd/config.toml
sudo useradd -M -G video greeter
sudo chmod -R go+r /etc/greetd/

if (systemctl -q is-active lightdm)
    then
	sudo systemctl disable lightdm
fi

sudo systemctl enable greetd
