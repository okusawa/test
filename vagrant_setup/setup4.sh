#!/usr/bin/env bash

echo "-------------------- setup4 start --------------------"
date

# rails
gem update --system >/dev/null 2>&1
gem install rails -v 4.1.1 >/dev/null 2>&1
rbenv rehash

# mysql
sudo apt-get install -y mysql-server-5.5 mysql-client libmysqlclient-dev
sudo chmod 777 /etc/mysql/my.cnf
sudo echo '[mysqld]' >> /etc/mysql/my.cnf
sudo echo 'character_set_server = utf8' >> /etc/mysql/my.cnf
sudo echo '[mysql]' >> /etc/mysql/my.cnf
sudo echo 'default-character-set = utf8' >> /etc/mysql/my.cnf
sudo chmod 660 /etc/mysql/my.cnf
sudo /etc/init.d/mysql restart

# imagemagick
# sudo aptitude install -y imagemagick libimagemagick libmagickcore libmagickcore-dev libmagickwand-dev >/dev/null 2>&1
# gem install rmagick >/dev/null 2>&1

cd ~/work

# database.yml
# cp vagrant_setup/database.yml config/
# pwfile
#cp vagrant_setup/pwfile config/

#lib/setup/make_user_config.rb

# bundle
gem install capybara-webkit -v '1.1.0'
bundle install

# rake db:migrate:reset
# rake db:seed

date
echo "--------------------- setup4 end ---------------------"
