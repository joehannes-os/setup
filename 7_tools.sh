#!/bin/bash

echo "7. TOOLS and UTILS"

echo "ranger cli-filemanager plugin(s)"
gh repo clone alexanderjeurissen ranger_devicons ~/.local/git/ranger_devicons
cd ~/.local/git/ranger_devicons && make install && cd

echo "oh-my-tmux"
gh repo clone gpakosz .tmux ~/.oh-my-tmux
cp ~/.oh-my-tmux/.tmux.con* ~/

echo "oh-my-git"
gh repo clone arialdomartini oh-my-git ~/.oh-my-git

echo "tdrop"
gh repo clone noctuid tdrop ~/.local/git/tdrop
ln -s ~/.local/git/tdrop/tdrop ~/.local/bin/tdrop
