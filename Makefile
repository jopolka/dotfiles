PACKAGE_MANAGER := sudo dnf install -y

install_vim:
	$(PACKAGE_MANAGER) vim

install_zsh:
	$(PACKAGE_MANAGER) zsh util-linux-user
	sh -c i "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
	chsh -s $$(which zsh)

vim: install_vim

zsh: install_zsh

.PHONY: install_vim install_zsh vim zsh
