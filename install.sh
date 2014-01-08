#!/bin/bash

ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc

git clone https://github.com/gmarik/vundle.git vim/bundle/vundle

mkdir -p ~/.fonts/
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf -P ~/.fonts/
fc-cache -vf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d/
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
