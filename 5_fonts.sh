#!/bin/bash

cd ~/.local/share/fonts

echo "FiraMono NerdFont"
curl -fLo "FiraMono Nerd Font.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraMono/Regular/complete/Fira%20Mono%20Regular%20Nerd%20Font%20Complete.otf

if command -v fc-cache &> /dev/null; then
	sudo fc-cache
fi

cd
