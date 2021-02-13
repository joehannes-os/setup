#!/bin/bash

# DIRS
echo "Creating project and local bin dirs"
cd
mkdir -p ~/.local/git
mkdir -p ~/.local/bin
mkdir -p ~/.local/log
mkdir ~/.fonts

# APPS
echo "Installing Software/Apps making feel the dev right at home"
if [[ `uname` == 'Darwin' ]]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew install hub
	brew install zsh zsh-completions
	brew tap caskroom/cask
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
	pip install powerline-status
	gem install github
fi

if [[ `uname` == 'Linux' ]]; then
	if command -v apt &> /dev/null; then
		sudo apt install -y zsh zsh-*
		sudo apt install -y fonts-powerline powerline
		sudo apt install -y git git-flow git-extras curl
		sudo apt install -y taskwarrior timewarrior bugwarrior tasksh
		sudo apt install -y make ruby golang python-gobject
		sudo apt install -y chromium-browser qutebrowser
    sudo apt install -y neomutt msmtp pass
		sudo apt install -y silversearcher-ag ripgrep peco yank tig bat fasd ranger w3m lynx elinks tmux tmuxinator
		sudo gem install github cani neovim
		# extra fonts like powerline
		mkdir ~/.fonts
		curl -o- https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf?raw=true > ~/.fonts/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
		sudo apt install fonts-hack fonts-hack-ttf -y
		sudo fc-cache
		cd
	elif command -v sisyphus &> /dev/null; then
		sudo sisyphus install app-shells/zsh app-shells/gentoo-zsh-completions
		sudo sisyphus install -e app-shells/powerline media-fonts/powerline-symbols
		sudo sisyphus install -e dev-vcs/git dev-vcs/git-flow dev-util/github-cli dev-vcs/git-tools
		sudo sisyphus install -e app-misc/task app-misc/timew
		sudo sisyphus install -e dev-lang/ruby dev-lang/go dev-python/pygobject
		sudo sisyphus install -e www-client/google-chrome www-client/elinks
		sudo sisyphus install -e mail-client/neomutt mail-mta/msmtp app-admin/pass
		sudo sisyphus install -e sys-apps/the_silver_searcher sys-apps/ripgrep
		sudo sisyphus install -e app-shells/peco dev-vcs/tig sys-apps/bat app-shells/fasd app-misc/ranger www-client/w3m app-misc/tmux x11-terms/tmuxinator app-editors/neovim dev-python/neovim-remote dev-ruby/neovim-ruby-client
		sudo gem install github cani neovim
		mkdir ~/.fonts
		curl -o- https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf?raw=true > ~/.fonts/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
		sudo fc-cache
	else
		sudo gem install github cani neovim
		mkdir ~/.fonts
		curl -o- https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf?raw=true > ~/.fonts/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
		sudo fc-cache
	fi
fi

# Change Default shell plus activate zsh without need to logout/login
echo "Switching to zsh"
chsh -s $(which zsh)
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Ruby Gems
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --ruby

# Python Pip stuff
curl https://bootstrap.pypa.io/get-pip.py -o ~/.local/bin/get-pip.py
python2 ~/.local/bin/get-pip.py
pip install --user --upgrade pynvim
python2 -m pip install --user --upgrade pynvim
pip3 install --user --upgrade pynvim

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fzf fzy fasd ms-jpq/sad/sad

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/jimeh/zsh-peco-history.git $ZSH_CUSTOM/plugins/zsh-peco-history
git clone https://github.com/psprint/zsh-select.git $ZSH_CUSTOM/plugins/zsh-select
git clone https://github.com/b4b4r07/zsh-vimode-visual.git $ZSH_CUSTOM/plugins/zsh-vimode-visual

# email
git clone https://github.com/LukeSmithxyz/mutt-wizard ~/.local/git/mutt-wizard
cd ~/.local/git/mutt-wizard
sudo make install
cd

# Config Git
echo "Configuring git"
git config --global push.default matching
git config --global user.email "johannes.neugschwentner@gmail.com"
git config --global user.name "Johannes Neugschwentner"
git config --global github.user "joehannes"

# NODE
echo "Installing NVM plus latest Node, plus some npm packages ..."
cd ~/.local/git
hub clone nvm-sh/nvm
./nvm/install.sh
my_node_version=$(nvm ls-remote | grep Latest | tail -1 | awk '{print $1}')
nvm install $my_node_version
nvm use $my_node_version
npm i -g npm yarn
npm i -g bash-language-server tern typescript sass manu to-markdown-cli

mkdir ~/.manu-pages
mkdir ~/.manu-pages/md
mkdir ~/.manu-pages/html
mkdir ~/.manu-pages/json
mkdir ~/.manu-pages/md-detailled

manu pull html svg javascript css sass react redux jest
cd ~/.manu-pages/html
for d in *; do
  mkdir ../md-detailled/$d
done
for d in */*.html; do
  html2md -i $d -o ../md-detailled/$d.md
done

echo "Taking care of your zsh-stuff ..."

# oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# themes
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
# plugins
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/wbingli/zsh-wakatime.git ~/.oh-my-zsh/custom/plugins/zsh-wakatime
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
mkdir ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/highlighters/url && curl -o- https://raw.githubusercontent.com/ascii-soup/zsh-url-highlighter/master/url/url-highlighter.zsh > ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/highlighters/url/url-highlighter.zsh

# zshconfig
curl -o- https://raw.githubusercontent.com/joehannes-os/dotfiles/master/.zshrc > ~/.zshrc
autoload -U compinit && compinit

source ~/.zshrc

# ranger plugin(s)
git clone git@github.com:alexanderjeurissen/ranger_devicons.git ~/git/ranger_devicons
cd ~/git/ranger_devicons
make install
cd

# util
cd ~/.local/git
hub clone gpakosz/.tmux oh-my-tmux
cp oh-my-tmux/.tmux.con* ~/

sudo wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O /usr/local/share/zsh/site-functions/_tmuxinator

mkdir joehannes-os && cd joehannes-os
hub clone joehannes-os/setup
hub clone joehannes-os/dotfiles
hub clone joehannes-os/bin

ln -s ~/.local/git/joehannes-os/dotfiles/.tmux.conf.local ~/.tmux.conf.local
ln -s ~/.local/git/joehannes-os/dotfiles/.editorconfig ~/.editorconfig
ln -s ~/.local/git/joehannes-os/dotfiles/.tigrc ~/.tigrc
ln -s ~/.local/git/joehannes-os/dotfiles/.promptline.sh ~/.promptline.sh
ln -s ~/.local/git/joehannes-os/dotfiles/.wakatime.cfg ~/.wakatime.cfg
ln -s ~/.local/git/joehannes-os/dotfiles/.zshrc ~/.zshrc

ln -s ~/.local/git/joehannes-os/bin/camshot ~/.local/bin/camshot
ln -s ~/.local/git/joehannes-os/bin/camobserve ~/.local/bin/camobserve
ln -s ~/.local/git/joehannes-os/bin/votd ~/.local/bin/votd
ln -s ~/.local/git/joehannes-os/bin/yt2mp3 ~/.local/bin/yt2mp3
ln -s ~/.local/git/joehannes-os/bin/gpwd ~/.local/bin/gpwd
ln -s ~/.local/git/joehannes-os/bin/kp ~/.local/bin/kp

cd ~/.local/git/joehannes-os/dotfiles
mkdir ~/.config
cp -R ./.config/* ~/.config/
cp -R ./task ~/
cd
systemctl --user enable bugwarrior-pull.timer
systemctl --user start bugwarrior-pull.timer

# gitmux
go get -u github.com/arl/gitmux

# nvim
nvim -c ":PlugInstall" -c ":qa"

# ECHOS - Corrections ...
echo "Don't forget to `git config --global user.email` to company email!"
echo "Please set Powerline font for terminal: eg. in iterm -> pref -> profile -> text -> change font: Meslo for Powerline"
echo "Run bugwarrior-vault!"

exit 0
