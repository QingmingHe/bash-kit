#!/usr/bin/env bash

# Install all configuration files under dotconfig/
dotconfdir="dotconfig"
for f in `ls $dotconfdir/`;
do
    echo install $dotconfdir/$f to ~/.$f
    if [[ -f ~/.$f ]]
    then
        cp ~/.$f ~/.$f.bak
    fi
    ln -sf $PWD/$dotconfdir/$f ~/.$f
done

# Install vim configuration
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

# Install Cygwin.bat for cygwin.
# if [[ "$OSTYPE" == "cygwin" ]]
# then
#     if [[ -f /Cygwin.bat ]]
#     then
#         mv /Cygwin.bat /Cygwin.bat.bak
#     fi
#     cp -f Cygwin.bat /
# fi
