#!/bin/bash

DOT_FILES=(.gitconfig .tmux.conf)

for file in ${DOT_FILES[@]}; do
	ans=y
	if [ -e $file ]; then
		echo -n "Replace ${file}? [y/n]: "
		read ans
	fi
	if [ "$ans" == "y" ]; then
		ln -fs $HOME/.dotfiles/$file $HOME/$file
	fi
done
