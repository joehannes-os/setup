#!/bin/bash

echo "Cloning Personal Repos like dotfiles"

mkdir -p ~/.local/git/joehannes-os
cd ~/.local/git/joehannes-os
gh repo clone joehannes-os/dotfiles
gh repo clone joehannes-os/bin
gh repo clone joehannes-os/devdocs

echo "Symlinking Config files"
rm ~/.tmux.conf.local
ln -s ~/.local/git/joehannes-os/dotfiles/.tmux.conf.local ~/.tmux.conf.local
ln -s ~/.local/git/joehannes-os/dotfiles/.editorconfig ~/.editorconfig
ln -s ~/.local/git/joehannes-os/dotfiles/.tigrc ~/.tigrc
ln -s ~/.local/git/joehannes-os/dotfiles/.promptline.sh ~/.promptline.sh
ln -s ~/.local/git/joehannes-os/dotfiles/.zshrc ~/.zshrc
ln -s ~/.local/git/joehannes-os/dotfiles/.mailcap ~/.mailcap
ln -s ~/.local/git/joehannes-os/dotfiles/.gitignore ~/.gitignore

cp -R ~/.local/git/joehannes-os/dotfiles/.task ~/

cd ~/.local/git/joehannes-os/dotfiles/.config
for d in *; do
	mkdir -p ~/.config/$d
done
for f in */*; do
	ln -s ~/.local/git/joehannes-os/dotfiles/.config/$f ~/.config/$f
done

ln -s ~/.local/git/joehannes-os/bin/camshot ~/.local/bin/camshot
ln -s ~/.local/git/joehannes-os/bin/camobserve ~/.local/bin/camobserve
ln -s ~/.local/git/joehannes-os/bin/votd ~/.local/bin/votd
ln -s ~/.local/git/joehannes-os/bin/gpwd ~/.local/bin/gpwd
ln -s ~/.local/git/joehannes-os/bin/kp ~/.local/bin/kp
ln -s ~/.local/git/joehannes-os/bin/http_status_codes.zsh ~/.local/bin/http_status_codes.zsh
ln -s ~/.local/git/joehannes-os/bin/gtm-plugin.sh ~/.local/bin/gtm-plugin.sh

echo ">> Installing Manu Documentation Engine"

mkdir ~/.manu-pages
mkdir ~/.manu-pages/md
mkdir ~/.manu-pages/html
mkdir ~/.manu-pages/json
mkdir ~/.manu-pages/md-detailled

cd ~/.manu-pages/html
for d in *; do
  mkdir ../md-detailled/$d
done
for d in */*.html; do
  html2md -i $d -o ../md-detailled/$d.md
done

echo ">> Config Git"
git config --global push.default matching
git config --global user.email "johannes.neugschwentner@gmail.com"
git config --global user.name "Johannes Neugschwentner"
git config --global github.user "joehannes"

echo "Enabling Bugwarrior CronJobLike SystemD Service"
systemctl --user enable bugwarrior-pull.timer
systemctl --user start bugwarrior-pull.timer

echo "Neovim"
nvim -c ":PlugInstall" -c ":qa"
