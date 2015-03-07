#!/usr/bin/env bash

for f in `ls config/`;
do
    echo install config/$f to ~/.$f
    if [[ -f ~/.$f ]]
    then
        cp ~/.$f ~/.$f.bak
    fi
    ln -sf $PWD/config/$f ~/.$f
done

echo install vim configuration
if [[ -d ~/.vim ]]
then
    if [[ -d ~/.vim.bak ]]
    then
        rm -rf ~/.vim.bak
    fi
    mv ~/.vim ~/.vim.bak
fi
cp -r vim ~/.vim
