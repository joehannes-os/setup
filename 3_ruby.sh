#!/bin/bash

echo "3. RUBY"

echo "3.1 RVM - Ruby Version Manager"

gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --ruby

echo "3.2 Install newer ruby version"

rvm install ruby --latest

echo "3.2 GEMS - Installing Ruby Gems"

gem install cani neovim neovim-ruby-host
