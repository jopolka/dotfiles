update:
	sudo apt-get update -y
	sudo apt-get upgrade -y
	sudo apt-get autoremove -y
	sudo apt-get autoclean -y

install_basic:
	sudo apt-get install -y kitty scrot rofi git build-essential xcb libxcb-xkb-dev vim bat

install_i3:
ifeq (,$(wildcard ~/.i3))
	sudo apt-get install -y i3-wm py3status python3-tzlocal libdbus-1-dev libdbus-glib-1-de
	ln -s $(pwd)/.i3 ~/.i3
else
	@echo "i3 already installed"
endif

install_greetd:
ifeq (,$(wildcard /etc/greetd/config.toml))
	sudo apt-get install -y cargo libpam0g-dev python3-pydbus python3-gi python3-gi-cairo gir1.2-gtk-4.0

	./greetd/build.sh

	sudo mkdir /etc/greetd
	sudo ln -s $(pwd)/greetd/config.toml /etc/greetd/config.toml
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
