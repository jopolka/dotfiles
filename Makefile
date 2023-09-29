update:
	sudo apt-get update -y
	sudo apt-get upgrade -y
	sudo apt-get autoremove -y
	sudo apt-get autoclean -y

install_basic:
	sudo apt-get install -y kitty nm-applet scrot rofi

install_i3:
	sudo apt-get install -y i3_wm py3status 
	ln -s ${pwd}/.i3 .i3

.PHONY: update install_basic insta
