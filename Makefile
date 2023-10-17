update:
	sudo apt-get update -y
	sudo apt-get upgrade -y
	sudo apt-get autoremove -y
	sudo apt-get autoclean -y

install_basic:
	sudo apt-get install -y kitty scrot rofi git build-essential xcb libxcb-xkb-dev vim bat ripgrep curl fzf

install_i3:
ifeq (,$(wildcard ~/.i3))
	sudo apt-get install -y i3-wm py3status python3-tzlocal libdbus-1-dev libdbus-glib-1-dev
	git clone https://github.com/tobi-wan-kenobi/bumblebee-status
	ln -s $(shell pwd)/.i3 ~/.i3
	ln -s $(shell pwd)/.i3/.xinitrc ~/.xinitrc
else
	@echo "i3 already installed"
endif

install_greetd:
ifeq (,$(wildcard /etc/greetd/config.toml))
	sudo apt-get install -y cargo libpam0g-dev python3-pydbus python3-gi python3-gi-cairo gir1.2-gtk-4.0

	./greetd/build.sh

	sudo mkdir /etc/greetd
	sudo sudo ln -f -s $(shell pwd)/greetd/config.toml /etc/greetd/config.toml
	sudo useradd -M -G video greeter
	sudo chmod -R go+r /etc/greetd/

	sudo systemctl disable lightdm
	sudo systemctl enable greetd
else
	@echo "greetd already installed"
endif


install_tuigreet:
ifeq (,$(wildcard /usr/local/tuigreet))
	sudo apt-get install -y cargo
	./tuigreet/build.sh
else
	@echo "tuigreet already installed"
endif

install_kitty:
	sudo apt-get install -y kitty
	ln -s -f $(shell pwd)/kitty ~/.config/kitty


install_fonts:
	./fonts/install.sh
	# git clone https://github.com/ryanoasis/nerd-fonts
	# cd nerd-fonts
	# ./install.sh
	# cd..
	# rm -rg nerd-fonts

install_zsh:
	./zsh/install.sh

install_tmux:
	./tmux/install.sh

install_vim:
	./vim/install.sh

complete: update install_basic install_fonts install_i3 install_tuigreet install_greetd install_zsh install_kitty install_tmux
	setxkbmap de

.PHONY: update install_basic install_fonts install_i3 install_tuigreet install_greetd install_zsh install_kitty install_tmux
