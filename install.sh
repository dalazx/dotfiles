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

ln -s ~/Dropbox/.ssh ~/.ssh
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

mv ~/.bashrc ~/.bashrc_backup
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/tmux ~/.tmux

ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc

git clone https://github.com/gmarik/vundle.git vim/bundle/vundle

pip install pyprof2calltree

sudo apt-get install vim-gtk

sudo pip install pylama


mkdir ~/dev
