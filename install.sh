#!/bin/bash

sudo apt-get update && sudo apt-get dist-upgrade
# GUI
# google-chrome
# skype
sudo apt-get install thunderbird
sudo apt-get install nautilus-dropbox

sudo apt-get install git-core
sudo apt-get install subversion
sudo apt-get install build-essential cmake python-dev
sudo apt-get install pkg-config

ln -s ~/Dropbox/.ssh ~/.ssh
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

mv ~/.bashrc ~/.bashrc_backup
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/tmux ~/.tmux

ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc

ln -s ~/.dotfiles/irssi ~/.irssi

ln -s ~/.dotfiles/Brewfile ~/Brewfile

git clone https://github.com/gmarik/vundle.git vim/bundle/vundle

sudo apt-get install python-setuptools
sudo easy_install pip
sudo pip install -U distribute pip
sudo pip install virtualenv

pip install pyprof2calltree

sudo apt-get install vim-gtk

sudo pip install pylama

sudo apt-get install virtualbox
# vagrant
sudo apt-get install libmysqlclient-dev

mkdir ~/dev

sudo apt-get install -y s3cmd
sudo apt-get install -y htop
sudo apt-get install -y meld
