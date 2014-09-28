#!/usr/bin/env bash

echo "-------------------- setup1 start --------------------"
date

# タイムゾーン設定
sudo chmod 777 /etc/timezone
sudo echo "Asia/Tokyo" > /etc/timezone
sudo chmod 660 /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

sudo apt-get update >/dev/null 2>&1

# 必要なツール類のinstall
sudo apt-get -y install git >/dev/null 2>&1
sudo apt-get install -y curl g++ >/dev/null 2>&1
sudo apt-get install -y zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev libaio1 >/dev/null 2>&1
sudo apt-get install -y emacs >/dev/null 2>&1
sudo apt-get install -y tmux >/dev/null 2>&1

sudo apt-get install -y libqt4-dev

# rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# 共有ディレクトリをホームディレクトリ直下にシンボリックリンク
ln -s /vagrant ~/work

date
echo "--------------------- setup1 end ---------------------"
exec $SHELL
