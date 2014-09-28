#!/usr/bin/env bash

echo "-------------------- setup2 start --------------------"
date

# bundle exec しないためのプラグイン
mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins
git clone git://github.com/ianheggie/rbenv-binstubs.git >/dev/null 2>&1
git clone git://github.com/sstephenson/ruby-build.git >/dev/null 2>&1
sudo ~/.rbenv/plugins/ruby-build/install.sh >/dev/null 2>&1
cd ~/work

date
echo "--------------------- setup2 end ---------------------"
exec $SHELL
