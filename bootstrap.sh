#!/bin/zsh

# DIRS
echo "Creating project and local bin dirs"
cd
mkdir ~/git
mkdir ~/bin

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
	gem install node-sass
	gem install github
fi

if [[ `uname` == 'Linux' ]]; then
	if command -v apt &> /dev/null; then
		sudo apt install -y zsh zsh-*
		sudo apt install -y fonts-powerline powerline
		sudo apt install -y git git-flow git-extras
		sudo apt install -y make ruby golang python3-pip
		sudo apt install -y chromium-browser
		sudo snap install atom --classic
		pip3 install --upgrade pip
		pip install jupyter
		sudo gem install node-sass
		sudo gem install github
		# extra fonts like powerline
		mkdir ~/.fonts
		curl -o- https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf?raw=true > ~/.fonts/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
		sudo fc-cache
		# install git-time-metrics
		wget https://github.com/git-time-metric/gtm/releases/download/v1.2.11/gtm.v1.2.11.linux.tar.gz -O ~/Downloads/gtm.v1.2.11.linux.tar.gz
		tar xzvf ~/Downloads/gtm.v1.2.11.linux.tar.gz -C ~/bin/
		# install hub github-wrapper (hub is a git-wrapper for github)
		wget https://github.com/github/hub/releases/download/v2.3.0-pre10/hub-linux-amd64-2.3.0-pre10.tgz -O ~/Downloads/hub-linux-amd64-2.3.0-pre10.tgz
		tar xzvf ~/Downloads/hub-linux-amd64-2.3.0-pre10.tgz -C ~/bin
		sudo ~/bin/hub-linux-amd64-2.3.0-pre10/install
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
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
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
curl -o- https://raw.githubusercontent.com/joehannes/osConfig/master/.zshrc > ~/.zshrc
autoload -U compinit && compinit

# Install Atom Packages
echo "INSTALLING atom.io packages with apm"
curl -o-https://raw.githubusercontent.com/joehannes/osConfig/master/bootstrap_atom.sh | zsh

# ECHOS - Corrections ...
echo "Don't forget to `git config --global user.email` to company email!"
echo "Please set Powerline font for terminal: eg. in iterm -> pref -> profile -> text -> chane font: Meslo for Powerline"

exit 0
