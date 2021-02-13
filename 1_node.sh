#!/bin/bash

echo "1. Node.js"
echo ">> Cloneing NVM"
gh repo clone nvm-sh nvm ~/.local/git/nvm
~/.local/git/nvm/install.sh
echo ">> Installing NVM plus latest Node, plus some npm packages ..."
nvm install --lts
nvm use default
npm i -g npm yarn
npm i -g bash-language-server tern typescript sass manu to-markdown-cli

