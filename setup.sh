#!/bin/bash

DOT_FILES=(.profile .gitconfig .screenrc .zshrc .vimrc)

for file in ${DOT_FILES[@]}; do
    ln -fs $HOME/.dotfiles/$file $HOME/$file
done
