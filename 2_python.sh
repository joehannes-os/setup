#!/bin/bash

echo "2. PYTHON >>"

cd

echo "Fetching out of lifespan python2-pip"
curl https://bootstrap.pypa.io/2.7/get-pip.py -o ~/.local/bin/get-pip_python2.py
python2 ~/.local/bin/get-pip_python2.py

echo "2.1 Python2 modules"

python2 -m pip install --user powerline-status
python2 -m pip install --user -U "bugwarrior[keyring]"
python2 -m pip install --user -U "bugwarrior[jira]"
python2 -m pip install --user pynvim

echo "2.2 Python3 modules"

pip install --user pynvim
pip install --user bpytop
