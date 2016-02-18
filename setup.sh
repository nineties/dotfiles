#!/bin/bash

DOT_FILES=(.profile .gitconfig .tmux.conf .zshrc .vimrc)

for file in ${DOT_FILES[@]}; do
    ln -fs $HOME/.dotfiles/$file $HOME/$file
done
