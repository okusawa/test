#!/usr/bin/env bash

sudo apt-get install -y zsh

mkdir ~/zsh_plugins
cd ~/zsh_plugins
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/zsh_plugins/oh-my-zsh
git clone git://github.com/zsh-users/zaw.git ~/zsh_plugins/zaw
git clone https://github.com/rupa/z.git ~/zsh_plugins/z
git clone https://github.com/hchbaw/auto-fu.zsh.git ~/zsh_plugins/auto-fu.zsh
cp /vagrant/vagrant_setup/.zshrc ~/

# ついでにtmux.confも
cp /vagrant/vagrant_setup/.tmux.conf ~/

echo 'export LC_ALL=en_US.UTF-8' >> ~/.zshrc
echo 'export LANG="en_US.UTF-8"' >> ~/.zshrc
echo 'export LANGUAGE="en_US:en"' >> ~/.zshrc

chsh
# password => vagrant
# path /usr/bin/zsh
