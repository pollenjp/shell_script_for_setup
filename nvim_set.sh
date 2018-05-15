#!/bin/bash


cd
directory="${HOME}/dotfiles"
if [ ! -d "$directory" ] 
then
	git clone git@bitbucket.org:pollenjp/dotfiles.git
fi


directory="${HOME}/.config"
if [ ! -d "$directory" ] 
then
	mkdir "$directory"
fi

directory="${HOME}/.config/nvim"
directory2="${HOME}/dotfiles/_vim"
ln -s "$directory2" "$directory"

file="${HOME}/.config/nvim/init.vim"
file2="${HOME}/dotfiles/.vimrc"
ln -s "$file2" "$file"
