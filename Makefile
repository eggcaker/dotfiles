install:
	@./commands/bin/stow-all
	@rm -rf ~/.config/xonsh; cp -r ${HOME}/.dotfiles/xonsh/.xonsh.d ${HOME}/.config/xonsh
