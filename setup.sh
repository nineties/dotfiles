#!/bin/bash

DOT_FILES=(.profile .gitconfig .screenrc .zshrc .vimrc .tmux.conf)

for file in ${DOT_FILES[@]}; do
    ln -fs $HOME/.dotfiles/$file $HOME/$file
done
