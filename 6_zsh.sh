#!/bin/bash

echo "6. ZSH"

echo ">> Changing default shell to zsh - will need to relogin"
chsh -s $(which zsh)

echo ">> Fetching and Installing zplug zsh-plugin-manager"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

echo ">> OH-MY-ZSH"
gh repo clone robbyrussell oh-my-zsh ~/.oh-my-zsh

echo ">> oh-my-zsh themes"
gh repo clone bhilburn powerlevel9k ~/.oh-my-zsh/custom/themes/
gh repo clone romkatv powerlevel10k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

echo ">> oh-my-zsh plugins"
gh repo clone zsh-users zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
gh repo clone wbingli zsh-wakatime ~/.oh-my-zsh/custom/plugins/zsh-wakatime
gh repo clone zsh-users zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
mkdir -p ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/highlighters/url
curl -o- https://raw.githubusercontent.com/ascii-soup/zsh-url-highlighter/master/url/url-highlighter.zsh > ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/highlighters/url/url-highlighter.zsh
gh repo clone zsh-users zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
gh repo clone jimeh zsh-peco-history ${ZSH_CUSTOM:-${ZSH_CUSTOM:-/.oh-my-zsh/custom}/.oh-my-zsh/custom}/plugins/zsh-peco-history
gh repo clone psprint zsh-select ${ZSH_CUSTOM:-${ZSH_CUSTOM:-/.oh-my-zsh/custom}/.oh-my-zsh/custom}/plugins/zsh-select
gh repo clone b4b4r07 zsh-vimode-visual ${ZSH_CUSTOM:-${ZSH_CUSTOM:-/.oh-my-zsh/custom}/.oh-my-zsh/custom}/plugins/zsh-vimode-visual

echo ">> tmuxinator zsh function"
sudo wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O /usr/local/share/zsh/site-functions/_tmuxinator

