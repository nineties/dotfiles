#!/bin/bash

DOT_FILES=(.profile .gitconfig .tmux.conf .zshrc .vimrc)

for file in ${DOT_FILES[@]}; do
	replace=y

    diff $HOME/.dotfiles/$file $HOME/$file > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        continue
    fi

	if [ -e $HOME/$file ]; then
		echo -n "Replace ${file}? [y/n]: "
		read replace
	fi
	if [ "$replace" == "y" ]; then
		ln -fs $HOME/.dotfiles/$file $HOME/$file
	fi
done
