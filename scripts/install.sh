#!/bin/bash
DOTFILES_DIRECTORY=~/.dotfiles
sudo apt update
if [ -d "$DOTFILES_DIRECTORY" ]; then
	sudo apt -y install terminator 
	sudo apt -y install fasd 
	sudo apt -y install tmux 
	sudo apt -y install xclip clipit 
	sudo apt -y install i3 i3lock i3blocks i3status 
	sudo apt -y install dunst dmenu scrot
	sudo apt -y install lxappearance xautolock rofi pavucontrol
	
	#zsh
	sudo apt -y install zsh
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	
	#zsh auto suggestions
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

	#mv ~/.tmux.conf ~/.tmux.conf_old
	ln -s $DOTFILES_DIRECTORY/.tmux.conf ~/.tmux.conf
	#mv ~/.config/i3/config ~/.config/i3/config_old
	mkdir ~/.config/i3
	ln -s $DOTFILES_DIRECTORY/i3/config ~/.config/i3/config
	mv ~/.zshrc ~/.zshrc_old
	ln -s $DOTFILES_DIRECTORY/.zshrc ~/.zshrc
	touch ~/.zshrc.local
	source ~/.zshrc
else
	echo "$DOTFILES_DIRECTORY nao existe. Vc ainda nao baixou seu repositorio dotfile!" 
	chsh -s $(which zsh)
fi
