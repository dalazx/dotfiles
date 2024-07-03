#!/bin/bash

ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Misc/ssh ~/.ssh
ln -s ~/github.com/dalazx/dotfiles/gitconfig ~/.gitconfig

mv ~/.bashrc ~/.bashrc_backup
ln -s ~/github.com/dalazx/dotfiles/bashrc ~/.bashrc
ln -s ~/github.com/dalazx/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/github.com/dalazx/dotfiles/tmux ~/.tmux

ln -s ~/github.com/dalazx/dotfiles/vim ~/.vim
ln -s ~/github.com/dalazx/dotfiles/vimrc ~/.vimrc

ln -s ~/.dotfiles/irssi ~/.irssi

ln -s ~/.dotfiles/Brewfile ~/Brewfile
ln -s ~/.dotfiles/globalrc ~/.globalrc

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

g clone --recursive git@github.com:dalazx/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
