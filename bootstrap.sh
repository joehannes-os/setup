#!/bin/bash

# DIRS
echo "Creating project and local bin dirs"
cd
mkdir ~/.git
mkdir ~/.bin

# APPS
echo "Installing Software/Apps making feel the dev right at home"
if [[ `uname` == 'Darwin' ]]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew install hub
	brew install zsh zsh-completions
	brew tap caskroom/cask
	brew cask install atom
	brew cask install git
	brew cask install google-chrome
	brew tap caskroom/fonts
	brew cask install font-liberation-mono-for-powerline
	brew cask install font-meslo-for-powerline
	brew cask install iterm2
	brew install git-flow
	brew install git-extras
	brew install python3
	brew install macvim --env-std --with-override-system-vim
	brew tap git-time-metric/gtm
	brew install gtm
	pip install jupyter
	pip install powerline-status
	gem install sass
	gem install github
fi

if [[ `uname` == 'Linux' ]]; then
	if command -v apt &> /dev/null; then
		sudo apt install -y zsh zsh-*
		sudo apt install -y fonts-powerline powerline
		sudo apt install -y git git-flow git-extras curl
		sudo apt install -y make ruby golang
		sudo apt install -y chromium-browser qutebrowser
		sudo apt install -y silversearcher-ag peco yank tig fasd ranger w3m lynx elinks tmux
		sudo gem install github
		sudo gem install hub
		# extra fonts like powerline
		mkdir ~/.fonts
		curl -o- https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf?raw=true > ~/.fonts/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
		sudo apt install fonts-hack fonts-hack-ttf -y
		sudo fc-cache
		cd
	fi
fi

# Change Default shell plus activate zsh without need to logout/login
echo "Switching to zsh"
chsh -s $(which zsh)
zsh

# Config Git
echo "Configuring git"
git config --global push.default matching
git config --global user.email "johannes.neugschwentner@gmail.com"
git config --global user.name "Johannes Neugschwentner"
git config --global github.user "joehannes"

# NODE
echo "Installing NVM plus latest Node, plus some npm packages ..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.zshrc
my_node_version=$(nvm ls-remote | grep Latest | tail -1 | awk '{print $1}')
nvm install $my_node_version
nvm use $my_node_version
echo "nvm use $my_node_version" >> ~/.zshrc
npm i -g npm
npm i -g bash-language-server tern typescript create-react-app

echo "Taking care of your zsh-stuff ..."
# oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
# zshconfig
curl -o- https://raw.githubusercontent.com/joehannes-os/setup/master/.zshrc > ~/.zshrc
autoload -U compinit && compinit

source ~/.zshrc

# ranger plugin(s)
git clone git@github.com:alexanderjeurissen/ranger_devicons.git ~/.git/ranger_devicons
cd ~/.git/ranger_devicons
make install
cd

# nvim
curl -o- https://raw.githubusercontent.com/joehannes-os/setup/master/init.vim >> ~/.config/nvim/init.vim
nvim -c ":PlugInstall" -c ":q" -c ":q"

# tmux
curl -o- https://raw.githubusercontent.com/joehannes-os/setup/master/.tmux.conf >> ~/.tmux.conf

# util
git clone git@github.com:joehannes-os/seek.git ~/.git/seek
git clone git@github.com:joehannes-os/devdocs.git ~/.git/devdocs
ln -s ~/.git/devdocs/devdocs ~/.bin/dd
ln -s ~/.git/seek/seek ~/.bin/sf


# Install Atom Packages - switched to internal atom-sync
# echo "INSTALLING atom.io packages with apm"
# curl -o- https://raw.githubusercontent.com/joehannes/osConfig/master/bootstrap_atom.sh | zsh

# ECHOS - Corrections ...
echo "Don't forget to `git config --global user.email` to company email!"
echo "Please set Powerline font for terminal: eg. in iterm -> pref -> profile -> text -> change font: Meslo for Powerline"

exit 0
