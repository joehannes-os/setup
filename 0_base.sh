#!/bin/bash

echo "1. Base Bootstrapper. Installing core apps & Co >>"

# DIRS
echo "1.1 Creating project and local bin dirs"
cd
mkdir -p ~/.local/git
mkdir -p ~/.local/bin
mkdir -p ~/.local/log
mkdir -p ~/.local/share/fonts
mkdir ~/.fonts
mkdir -p ~/.config/nvim

# APPS
echo "1.2 Installing Software/Apps making the dev feel right at home"
echo ">> detecting OS"

if [[ `uname` == 'Darwin' ]]; then
	echo ">> Darwin/Mac OS"
  # Mac OS - this needs some love, haven't had a Mac in a while
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
  brew tap wfxr/code-minimap
  brew install code-minimap
fi

if [[ `uname` == 'Linux' ]]; then
	echo ">> Linux System"

	if command -v apt &> /dev/null; then
		echo "... apt based distribution"
    # OMG Ubuntu

		echo ">> ZSH"
		sudo apt install -y zsh zsh-*

		echo ">> POWERLINE"
		sudo apt install -y fonts-powerline powerline

		echo ">> GIT"
		sudo apt install -y git git-flow git-extras curl wget

		echo ">> TASKWARRIOR - timetracking"
		sudo apt install -y taskwarrior timewarrior bugwarrior tasksh
		sudo snap install taskwarrior-tui

		echo ">> LANGUAGES and Compile Tools"
		sudo apt install -y make cmake ruby golang gob2 python3-pip

		echo ">> BROWSERS"
		sudo apt install -y chromium-browser qutebrowser
		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
		sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
		sudo apt update
		sudo apt install google-crhome-stable

		echo ">> EMAIL"
    sudo apt install -y neomutt msmtp pass isync

		echo ">> TERMINAL"
		sudo add-apt-repository ppa:mmstick76/alacritty
		sudo apt install -y alacritty

		echo ">> TOOLS"
		sudo apt install -y gawk silversearcher-ag ripgrep peco yank tig bat fasd ranger w3m lynx elinks tmux tmuxinator
		sudo apt install -y wmctrl xdotool xsel streamer xscreensaver
		sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
		sudo apt-add-repository https://cli.github.com/packages
		sudo apt update
		sudo apt install -y gh

		echo ">> TOOLS >> Setting up github"
		gh auth login

		echo ">> SYSTEM_FONTS"
		sudo apt install fonts-hack fonts-hack-ttf -y
		sudo fc-cache
	elif command -v sisyphus &> /dev/null; then
		echo ">> sisyphus based distribution/Red Core Linux"
    # Red Core Linux - Gentoo derivative
		sudo sisyphus install app-shells/zsh app-shells/gentoo-zsh-completions
		sudo sisyphus install -e app-shells/powerline media-fonts/powerline-symbols
		sudo sisyphus install -e dev-vcs/git dev-vcs/git-flow dev-util/github-cli dev-vcs/git-tools
		sudo sisyphus install -e app-misc/task app-misc/timew
		sudo sisyphus install -e dev-lang/ruby dev-lang/go dev-python/pygobject
		sudo sisyphus install -e www-client/google-chrome www-client/elinks
		sudo sisyphus install -e mail-client/neomutt mail-mta/msmtp app-admin/pass
		sudo sisyphus install -e sys-apps/the_silver_searcher sys-apps/ripgrep
		sudo sisyphus install -e app-shells/peco dev-vcs/tig sys-apps/bat app-shells/fasd app-misc/ranger www-client/w3m app-misc/tmux x11-terms/tmuxinator app-editors/neovim dev-python/neovim-remote dev-ruby/neovim-ruby-client
	fi

	echo "1.3 LinuxBREW"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	echo "Brew Formulas"
  brew tap wfxr/code-minimap
	brew install fzf fzy fasd ms-jpq/sad/sad code-minimap
fi

/bin/bash -c ./1_node.sh
/bin/bash -c ./2_python.sh
/bin/bash -c ./3_ruby.sh
/bin/bash -c ./4_go.sh
/bin/bash -c ./5_fonts.sh
/bin/bash -c ./6_zsh.sh
/bin/bash -c ./7_tools.sh
/bin/bash -c ./8_my_stuff.sh
