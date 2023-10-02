update:
	sudo apt-get update -y
	sudo apt-get upgrade -y
	sudo apt-get autoremove -y
	sudo apt-get autoclean -y

install_basic:
	sudo apt-get install -y kitty scrot rofi git build-essential xcb libxcb-xkb-dev

install_i3:
ifeq (,$(wildcard ~/.i3))
	sudo apt-get install -y i3-wm py3status 
	ln -s $(pwd)/.i3 ~/.i3
else
	@echo "i3 already installed"
endif

install_greetd:
ifeq (,$(wildcard /etc/greetd/config.toml))
	sudo apt-get install -y cargo

	./greetd/install.sh

	mkdir /etc/greetd
	ln -s $(pwd)/greetd/config.toml /etc/greetd/config.toml
	sudo useradd -M -G video greeter
	sudo chmod -R go+r /etc/greetd/

	systemctl enable --now greetd
else
	@echo "greetd already installed"
endif


install_tuigreet:
ifeq (,$(wildcard /usr/local/tuigreet))
	sudo apt-get install -y cargo
	git clone https://github.com/apognu/tuigreet
	cd tuigreet
	cargo build --release
	mv target/release/tuigreet /usr/local/bin/tuigreet
	cd ..
	rm -rf tuigreet
else
	@echo "tuigreet already installed"
endif

complete: update install_basic install_i3 install_greetd install_tuigreet
	setxkbmap de

.PHONY: update install_basic install_i3 install_greetd
