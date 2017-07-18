install:
	@./commands/bin/stow-all
	@rm -rf ~/.config/xonsh; ln -s ${HOME}/.dotfiles/xonsh/.xonsh.d ${HOME}/.config/xonsh
