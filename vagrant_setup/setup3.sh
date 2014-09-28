#!/usr/bin/env bash

echo "-------------------- setup3 start --------------------"
date

# ruby
MAKE_OPTS="-j 4" rbenv install 2.1.2
rbenv rehash
rbenv global 2.1.2

# gem
echo 'install: --no-ri --no-rdoc' > ~/.gemrc
echo 'update: --no-ri --no-rdoc' >> ~/.gemrc

# sudo字のPATHをユーザ(vagrant)と一緒にする
echo "alias sudo='sudo env PATH=$PATH'" >> ~/.bashrc

date
echo "--------------------- setup3 end ---------------------"
exec $SHELL
