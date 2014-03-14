#!/bin/bash

ln -s ~/Dropbox/.ssh ~/.ssh

ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/tmux ~/.tmux

ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc

git clone https://github.com/gmarik/vundle.git vim/bundle/vundle

mkdir -p ~/.fonts/
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf -P ~/.fonts/
fc-cache -vf ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d/
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf -P ~/.config/fontconfig/conf.d/

wget https://raw.github.com/phiggins/konsole-colors-solarized/master/Solarized%20Dark.colorscheme -P ~/.kde4/share/apps/konsole/
wget https://raw.github.com/phiggins/konsole-colors-solarized/master/Solarized%20Light.colorscheme -P ~/.kde4/share/apps/konsole/


pip install pyprof2calltree

sudo apt-get install vim-gtk
