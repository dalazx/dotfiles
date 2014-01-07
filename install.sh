#!/bin/bash

ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc

git clone https://github.com/gmarik/vundle.git vim/bundle/vundle
